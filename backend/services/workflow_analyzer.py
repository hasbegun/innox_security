"""
Workflow Analyzer Service
Parses Garak output to build workflow graphs showing probe-LLM interactions
"""
import re
import time
import json
from typing import Dict, List, Optional, Any
from uuid import uuid4

from models.schemas import (
    WorkflowGraph,
    WorkflowNode,
    WorkflowEdge,
    WorkflowTrace,
    WorkflowNodeType,
    WorkflowEdgeType,
    VulnerabilityFinding,
    WorkflowTimelineEvent
)


class WorkflowAnalyzer:
    """Analyzes Garak output to build workflow graphs"""

    def __init__(self):
        # Store active workflows by scan_id
        self.active_workflows: Dict[str, WorkflowGraph] = {}

        # Pattern matchers for Garak output
        self.patterns = {
            'probe_start': re.compile(r'garak\.probes\.(\S+)\s+starting'),
            'probe_complete': re.compile(r'garak\.probes\.(\S+)\s+(?:completed|complete)'),
            'generator': re.compile(r'(?:Using generator|Generator):\s*(?:garak\.generators\.)?(\S+)'),
            'prompt': re.compile(r'(?:Prompt|Generating|prompt)\s*(?:\d+)?:?\s*(.+)'),
            'model_response': re.compile(r'(?:Model response|response|Response)(?:\s*\(.*?\))?:\s*(.+)'),
            'detector': re.compile(r'(?:Running detector|Detector):\s*(?:garak\.detectors\.)?(\S+)'),
            'detector_result': re.compile(r'(?:Detector result|Result):\s*(PASS|FAIL)'),
            'vulnerability': re.compile(r'(?:🚨|Vulnerability found|FAIL).*?(?:Jailbreak|injection|bypass|leak)', re.IGNORECASE),
            'sending_to_model': re.compile(r'Sending to model:\s*(\S+)'),
            'tokens': re.compile(r'(\d+)\s*tokens?'),
            'latency': re.compile(r'(\d+\.?\d*)\s*(?:s|ms|seconds?|milliseconds?)'),
        }

    def get_or_create_workflow(self, scan_id: str) -> WorkflowGraph:
        """Get existing workflow or create new one"""
        if scan_id not in self.active_workflows:
            self.active_workflows[scan_id] = WorkflowGraph(
                scan_id=scan_id,
                nodes=[],
                edges=[],
                traces=[],
                statistics={
                    'total_interactions': 0,
                    'total_prompts': 0,
                    'total_responses': 0,
                    'vulnerabilities_found': 0,
                    'probes_executed': 0
                },
                layout_hints={}
            )
        return self.active_workflows[scan_id]

    def process_garak_output(self, scan_id: str, output_line: str) -> Optional[Dict[str, Any]]:
        """
        Process a single line of Garak output and update workflow graph

        Args:
            scan_id: Scan identifier
            output_line: Single line from Garak output

        Returns:
            Dictionary with parsed event data or None
        """
        workflow = self.get_or_create_workflow(scan_id)
        line = output_line.strip()

        if not line:
            return None

        timestamp = time.time()
        event = None

        # Check for probe start
        if match := self.patterns['probe_start'].search(line):
            probe_name = match.group(1)
            event = self._handle_probe_start(workflow, probe_name, timestamp)

        # Check for generator
        elif match := self.patterns['generator'].search(line):
            generator_name = match.group(1)
            event = self._handle_generator(workflow, generator_name, timestamp)

        # Check for prompt
        elif match := self.patterns['prompt'].search(line):
            prompt_content = match.group(1).strip()
            event = self._handle_prompt(workflow, prompt_content, timestamp)

        # Check for model being called
        elif match := self.patterns['sending_to_model'].search(line):
            model_name = match.group(1)
            event = self._handle_sending_to_model(workflow, model_name, timestamp)

        # Check for model response
        elif match := self.patterns['model_response'].search(line):
            response_content = match.group(1).strip()

            # Extract tokens and latency if present
            tokens = None
            latency_ms = None
            if tokens_match := self.patterns['tokens'].search(line):
                tokens = int(tokens_match.group(1))
            if latency_match := self.patterns['latency'].search(line):
                latency = float(latency_match.group(1))
                # Convert to ms if needed
                if 's' in latency_match.group(0) and 'ms' not in latency_match.group(0):
                    latency_ms = latency * 1000
                else:
                    latency_ms = latency

            event = self._handle_model_response(workflow, response_content, tokens, latency_ms, timestamp)

        # Check for detector
        elif match := self.patterns['detector'].search(line):
            detector_name = match.group(1)
            event = self._handle_detector(workflow, detector_name, timestamp)

        # Check for detector result
        elif match := self.patterns['detector_result'].search(line):
            result = match.group(1)
            event = self._handle_detector_result(workflow, result, timestamp)

        # Check for vulnerability
        elif self.patterns['vulnerability'].search(line):
            event = self._handle_vulnerability(workflow, line, timestamp)

        # Check for probe complete
        elif match := self.patterns['probe_complete'].search(line):
            probe_name = match.group(1)
            event = self._handle_probe_complete(workflow, probe_name, timestamp)

        return event

    def _handle_probe_start(self, workflow: WorkflowGraph, probe_name: str, timestamp: float) -> Dict:
        """Handle probe start event"""
        node_id = f"probe_{len([n for n in workflow.nodes if n.node_type == WorkflowNodeType.PROBE]) + 1}"

        node = WorkflowNode(
            node_id=node_id,
            node_type=WorkflowNodeType.PROBE,
            name=probe_name,
            description=f"Security probe: {probe_name}",
            metadata={'status': 'running'},
            timestamp=timestamp
        )

        workflow.nodes.append(node)
        workflow.statistics['probes_executed'] = workflow.statistics.get('probes_executed', 0) + 1

        # Create new trace for this probe
        trace = WorkflowTrace(
            trace_id=str(uuid4()),
            scan_id=workflow.scan_id,
            probe_name=probe_name,
            nodes=[node],
            edges=[],
            vulnerability_findings=[],
            statistics={}
        )
        workflow.traces.append(trace)

        return {
            'type': 'probe_start',
            'probe_name': probe_name,
            'node_id': node_id
        }

    def _handle_generator(self, workflow: WorkflowGraph, generator_name: str, timestamp: float) -> Dict:
        """Handle generator detection"""
        node_id = f"gen_{len([n for n in workflow.nodes if n.node_type == WorkflowNodeType.GENERATOR]) + 1}"

        node = WorkflowNode(
            node_id=node_id,
            node_type=WorkflowNodeType.GENERATOR,
            name=generator_name,
            description=f"Prompt generator: {generator_name}",
            metadata={},
            timestamp=timestamp
        )

        workflow.nodes.append(node)

        # Add to current trace
        if workflow.traces:
            current_trace = workflow.traces[-1]
            current_trace.nodes.append(node)

            # Link from probe to generator
            if len(current_trace.nodes) >= 2:
                edge = WorkflowEdge(
                    edge_id=str(uuid4()),
                    source_id=current_trace.nodes[-2].node_id,
                    target_id=node_id,
                    edge_type=WorkflowEdgeType.CHAIN,
                    content_preview="Initiating generator",
                    full_content="",
                    metadata={}
                )
                workflow.edges.append(edge)
                current_trace.edges.append(edge)

        return {
            'type': 'generator',
            'generator_name': generator_name,
            'node_id': node_id
        }

    def _handle_prompt(self, workflow: WorkflowGraph, prompt_content: str, timestamp: float) -> Dict:
        """Handle prompt being sent"""
        workflow.statistics['total_prompts'] = workflow.statistics.get('total_prompts', 0) + 1
        workflow.statistics['total_interactions'] = workflow.statistics.get('total_interactions', 0) + 1

        # Store prompt to attach to next LLM response node
        if workflow.traces:
            current_trace = workflow.traces[-1]
            if not hasattr(current_trace, '_pending_prompt'):
                current_trace._pending_prompt = prompt_content

        return {
            'type': 'prompt',
            'content': prompt_content
        }

    def _handle_sending_to_model(self, workflow: WorkflowGraph, model_name: str, timestamp: float) -> Dict:
        """Handle model invocation"""
        # Store model name for next response node
        if workflow.traces:
            current_trace = workflow.traces[-1]
            if not hasattr(current_trace, '_current_model'):
                current_trace._current_model = model_name

        return {
            'type': 'sending_to_model',
            'model_name': model_name
        }

    def _handle_model_response(self, workflow: WorkflowGraph, response_content: str,
                                tokens: Optional[int], latency_ms: Optional[float],
                                timestamp: float) -> Dict:
        """Handle LLM response"""
        node_id = f"llm_{len([n for n in workflow.nodes if n.node_type == WorkflowNodeType.LLM_RESPONSE]) + 1}"

        # Get model name and prompt from trace context
        model_name = "unknown"
        prompt_content = ""
        if workflow.traces:
            current_trace = workflow.traces[-1]
            if hasattr(current_trace, '_current_model'):
                model_name = current_trace._current_model
            if hasattr(current_trace, '_pending_prompt'):
                prompt_content = current_trace._pending_prompt
                delattr(current_trace, '_pending_prompt')  # Clear after use

        metadata = {
            'model': model_name
        }
        if tokens is not None:
            metadata['tokens'] = tokens
        if latency_ms is not None:
            metadata['latency_ms'] = latency_ms

        node = WorkflowNode(
            node_id=node_id,
            node_type=WorkflowNodeType.LLM_RESPONSE,
            name=f"{model_name} response",
            description=f"LLM response from {model_name}",
            metadata=metadata,
            timestamp=timestamp
        )

        workflow.nodes.append(node)
        workflow.statistics['total_responses'] = workflow.statistics.get('total_responses', 0) + 1

        # Add to current trace
        if workflow.traces:
            current_trace = workflow.traces[-1]
            current_trace.nodes.append(node)

            # Create edge from previous node (generator or probe) to LLM
            if len(current_trace.nodes) >= 2:
                edge = WorkflowEdge(
                    edge_id=str(uuid4()),
                    source_id=current_trace.nodes[-2].node_id,
                    target_id=node_id,
                    edge_type=WorkflowEdgeType.PROMPT,
                    content_preview=prompt_content[:100] if prompt_content else response_content[:100],
                    full_content=prompt_content,
                    metadata={'prompt': prompt_content}
                )
                workflow.edges.append(edge)
                current_trace.edges.append(edge)

            # Store response for next edge
            current_trace._last_response = response_content

        return {
            'type': 'llm_response',
            'content': response_content,
            'tokens': tokens,
            'latency_ms': latency_ms,
            'node_id': node_id
        }

    def _handle_detector(self, workflow: WorkflowGraph, detector_name: str, timestamp: float) -> Dict:
        """Handle detector execution"""
        node_id = f"det_{len([n for n in workflow.nodes if n.node_type == WorkflowNodeType.DETECTOR]) + 1}"

        node = WorkflowNode(
            node_id=node_id,
            node_type=WorkflowNodeType.DETECTOR,
            name=detector_name,
            description=f"Detector: {detector_name}",
            metadata={},
            timestamp=timestamp
        )

        workflow.nodes.append(node)

        # Add to current trace
        if workflow.traces:
            current_trace = workflow.traces[-1]
            current_trace.nodes.append(node)

            # Link from LLM response to detector
            if len(current_trace.nodes) >= 2:
                response_content = getattr(current_trace, '_last_response', '')
                edge = WorkflowEdge(
                    edge_id=str(uuid4()),
                    source_id=current_trace.nodes[-2].node_id,
                    target_id=node_id,
                    edge_type=WorkflowEdgeType.RESPONSE,
                    content_preview=response_content[:100],
                    full_content=response_content,
                    metadata={}
                )
                workflow.edges.append(edge)
                current_trace.edges.append(edge)

        return {
            'type': 'detector',
            'detector_name': detector_name,
            'node_id': node_id
        }

    def _handle_detector_result(self, workflow: WorkflowGraph, result: str, timestamp: float) -> Dict:
        """Handle detector result (PASS/FAIL)"""
        # Update last detector node with result
        if workflow.nodes:
            for node in reversed(workflow.nodes):
                if node.node_type == WorkflowNodeType.DETECTOR:
                    node.metadata['result'] = result
                    break

        return {
            'type': 'detector_result',
            'result': result
        }

    def _handle_vulnerability(self, workflow: WorkflowGraph, line: str, timestamp: float) -> Dict:
        """Handle vulnerability detection"""
        node_id = f"vuln_{len([n for n in workflow.nodes if n.node_type == WorkflowNodeType.VULNERABILITY]) + 1}"

        node = WorkflowNode(
            node_id=node_id,
            node_type=WorkflowNodeType.VULNERABILITY,
            name="Vulnerability Found",
            description=line,
            metadata={'severity': 'high'},
            timestamp=timestamp
        )

        workflow.nodes.append(node)
        workflow.statistics['vulnerabilities_found'] = workflow.statistics.get('vulnerabilities_found', 0) + 1

        # Add to current trace
        if workflow.traces:
            current_trace = workflow.traces[-1]
            current_trace.nodes.append(node)

            # Create vulnerability finding
            finding = VulnerabilityFinding(
                vulnerability_type="Security Issue",
                severity="high",
                probe_name=current_trace.probe_name,
                node_path=[n.node_id for n in current_trace.nodes],
                evidence=line
            )
            current_trace.vulnerability_findings.append(finding)

            # Link from detector to vulnerability
            if len(current_trace.nodes) >= 2:
                edge = WorkflowEdge(
                    edge_id=str(uuid4()),
                    source_id=current_trace.nodes[-2].node_id,
                    target_id=node_id,
                    edge_type=WorkflowEdgeType.DETECTION,
                    content_preview="Vulnerability detected",
                    full_content=line,
                    metadata={'severity': 'high'}
                )
                workflow.edges.append(edge)
                current_trace.edges.append(edge)

        return {
            'type': 'vulnerability',
            'evidence': line,
            'node_id': node_id
        }

    def _handle_probe_complete(self, workflow: WorkflowGraph, probe_name: str, timestamp: float) -> Dict:
        """Handle probe completion"""
        # Update probe node status
        for node in workflow.nodes:
            if node.node_type == WorkflowNodeType.PROBE and probe_name in node.name:
                node.metadata['status'] = 'completed'
                node.metadata['completed_at'] = timestamp
                break

        return {
            'type': 'probe_complete',
            'probe_name': probe_name
        }

    def get_workflow_graph(self, scan_id: str) -> Optional[WorkflowGraph]:
        """Get workflow graph for a scan"""
        return self.active_workflows.get(scan_id)

    def get_workflow_timeline(self, scan_id: str) -> List[WorkflowTimelineEvent]:
        """Get chronological timeline of workflow events"""
        workflow = self.active_workflows.get(scan_id)
        if not workflow:
            return []

        events = []
        for i, node in enumerate(sorted(workflow.nodes, key=lambda n: n.timestamp)):
            event = WorkflowTimelineEvent(
                event_id=f"event_{i}",
                event_type=node.node_type.value,
                timestamp=node.timestamp,
                title=node.name,
                description=node.description,
                node_id=node.node_id,
                metadata=node.metadata
            )

            # Add prompt/response if available from edges
            for edge in workflow.edges:
                if edge.target_id == node.node_id:
                    if edge.edge_type == WorkflowEdgeType.PROMPT:
                        event.prompt = edge.full_content
                    elif edge.edge_type == WorkflowEdgeType.RESPONSE:
                        event.response = edge.full_content

            # Add duration if available
            if 'latency_ms' in node.metadata:
                event.duration_ms = node.metadata['latency_ms']

            events.append(event)

        return events

    def export_workflow(self, scan_id: str, format: str = "json") -> str:
        """Export workflow in specified format"""
        workflow = self.active_workflows.get(scan_id)
        if not workflow:
            return ""

        if format == "json":
            return workflow.model_dump_json(indent=2)

        elif format == "mermaid":
            return self._export_mermaid(workflow)

        else:
            raise ValueError(f"Unsupported export format: {format}")

    def _export_mermaid(self, workflow: WorkflowGraph) -> str:
        """Export workflow as Mermaid diagram"""
        lines = ["graph TD"]

        # Add nodes
        for node in workflow.nodes:
            node_label = node.name.replace('"', "'")
            shape = self._get_mermaid_shape(node.node_type)
            lines.append(f'  {node.node_id}{shape[0]}"{node_label}"{shape[1]}')

        # Add edges
        for edge in workflow.edges:
            edge_label = edge.edge_type.value
            lines.append(f'  {edge.source_id} -->|{edge_label}| {edge.target_id}')

        return "\n".join(lines)

    def _get_mermaid_shape(self, node_type: WorkflowNodeType) -> tuple:
        """Get Mermaid shape brackets for node type"""
        shapes = {
            WorkflowNodeType.PROBE: ('[', ']'),
            WorkflowNodeType.GENERATOR: ('(', ')'),
            WorkflowNodeType.DETECTOR: ('{', '}'),
            WorkflowNodeType.LLM_RESPONSE: ('([', '])'),
            WorkflowNodeType.VULNERABILITY: ('[[', ']]'),
        }
        return shapes.get(node_type, ('[', ']'))

    def clear_workflow(self, scan_id: str):
        """Clear workflow data for a scan"""
        if scan_id in self.active_workflows:
            del self.active_workflows[scan_id]


# Global instance
workflow_analyzer = WorkflowAnalyzer()

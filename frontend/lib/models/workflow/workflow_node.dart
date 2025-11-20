/// Workflow node model
/// Represents a single node in the workflow graph
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_node.freezed.dart';
part 'workflow_node.g.dart';

/// Type of workflow node
enum WorkflowNodeType {
  @JsonValue('probe')
  probe,
  @JsonValue('generator')
  generator,
  @JsonValue('detector')
  detector,
  @JsonValue('llm_response')
  llmResponse,
  @JsonValue('vulnerability')
  vulnerability,
}

/// Workflow node representing a step in the security scan
@freezed
class WorkflowNode with _$WorkflowNode {
  const factory WorkflowNode({
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'node_type') required WorkflowNodeType nodeType,
    required String name,
    String? description,
    @Default({}) Map<String, dynamic> metadata,
    required double timestamp,
  }) = _WorkflowNode;

  factory WorkflowNode.fromJson(Map<String, dynamic> json) =>
      _$WorkflowNodeFromJson(json);
}

/// Extension for workflow node utilities
extension WorkflowNodeX on WorkflowNode {
  /// Get display name for the node
  String get displayName {
    switch (nodeType) {
      case WorkflowNodeType.probe:
        return '🔍 $name';
      case WorkflowNodeType.generator:
        return '⚙️ $name';
      case WorkflowNodeType.detector:
        return '🎯 $name';
      case WorkflowNodeType.llmResponse:
        return '🤖 $name';
      case WorkflowNodeType.vulnerability:
        return '⚠️ $name';
    }
  }

  /// Get DateTime from timestamp
  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(
        (timestamp * 1000).toInt(),
      );
}

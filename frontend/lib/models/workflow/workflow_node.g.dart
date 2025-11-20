// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowNodeImpl _$$WorkflowNodeImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowNodeImpl(
      nodeId: json['node_id'] as String,
      nodeType: $enumDecode(_$WorkflowNodeTypeEnumMap, json['node_type']),
      name: json['name'] as String,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      timestamp: (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$$WorkflowNodeImplToJson(_$WorkflowNodeImpl instance) =>
    <String, dynamic>{
      'node_id': instance.nodeId,
      'node_type': _$WorkflowNodeTypeEnumMap[instance.nodeType]!,
      'name': instance.name,
      'description': instance.description,
      'metadata': instance.metadata,
      'timestamp': instance.timestamp,
    };

const _$WorkflowNodeTypeEnumMap = {
  WorkflowNodeType.probe: 'probe',
  WorkflowNodeType.generator: 'generator',
  WorkflowNodeType.detector: 'detector',
  WorkflowNodeType.llmResponse: 'llm_response',
  WorkflowNodeType.vulnerability: 'vulnerability',
};

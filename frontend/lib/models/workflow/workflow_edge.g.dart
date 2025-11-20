// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowEdgeImpl _$$WorkflowEdgeImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowEdgeImpl(
      edgeId: json['edge_id'] as String,
      sourceId: json['source_id'] as String,
      targetId: json['target_id'] as String,
      edgeType: $enumDecode(_$WorkflowEdgeTypeEnumMap, json['edge_type']),
      contentPreview: json['content_preview'] as String? ?? '',
      fullContent: json['full_content'] as String? ?? '',
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$WorkflowEdgeImplToJson(_$WorkflowEdgeImpl instance) =>
    <String, dynamic>{
      'edge_id': instance.edgeId,
      'source_id': instance.sourceId,
      'target_id': instance.targetId,
      'edge_type': _$WorkflowEdgeTypeEnumMap[instance.edgeType]!,
      'content_preview': instance.contentPreview,
      'full_content': instance.fullContent,
      'metadata': instance.metadata,
    };

const _$WorkflowEdgeTypeEnumMap = {
  WorkflowEdgeType.prompt: 'prompt',
  WorkflowEdgeType.response: 'response',
  WorkflowEdgeType.detection: 'detection',
  WorkflowEdgeType.chain: 'chain',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowGraphImpl _$$WorkflowGraphImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowGraphImpl(
      scanId: json['scan_id'] as String,
      nodes: (json['nodes'] as List<dynamic>?)
              ?.map((e) => WorkflowNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => WorkflowEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statistics: json['statistics'] as Map<String, dynamic>? ?? const {},
      layoutHints: json['layout_hints'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$WorkflowGraphImplToJson(_$WorkflowGraphImpl instance) =>
    <String, dynamic>{
      'scan_id': instance.scanId,
      'nodes': instance.nodes,
      'edges': instance.edges,
      'statistics': instance.statistics,
      'layout_hints': instance.layoutHints,
    };

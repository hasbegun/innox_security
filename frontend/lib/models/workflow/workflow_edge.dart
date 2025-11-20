/// Workflow edge model
/// Represents a connection between nodes in the workflow graph
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_edge.freezed.dart';
part 'workflow_edge.g.dart';

/// Type of workflow edge
enum WorkflowEdgeType {
  @JsonValue('prompt')
  prompt,
  @JsonValue('response')
  response,
  @JsonValue('detection')
  detection,
  @JsonValue('chain')
  chain,
}

/// Workflow edge representing a connection between workflow steps
@freezed
class WorkflowEdge with _$WorkflowEdge {
  const factory WorkflowEdge({
    @JsonKey(name: 'edge_id') required String edgeId,
    @JsonKey(name: 'source_id') required String sourceId,
    @JsonKey(name: 'target_id') required String targetId,
    @JsonKey(name: 'edge_type') required WorkflowEdgeType edgeType,
    @JsonKey(name: 'content_preview') @Default('') String contentPreview,
    @JsonKey(name: 'full_content') @Default('') String fullContent,
    @Default({}) Map<String, dynamic> metadata,
  }) = _WorkflowEdge;

  factory WorkflowEdge.fromJson(Map<String, dynamic> json) =>
      _$WorkflowEdgeFromJson(json);
}

/// Extension for workflow edge utilities
extension WorkflowEdgeX on WorkflowEdge {
  /// Get display label for the edge
  String get label {
    switch (edgeType) {
      case WorkflowEdgeType.prompt:
        return 'Prompt';
      case WorkflowEdgeType.response:
        return 'Response';
      case WorkflowEdgeType.detection:
        return 'Detection';
      case WorkflowEdgeType.chain:
        return 'Chain';
    }
  }

  /// Check if edge has content
  bool get hasContent => fullContent.isNotEmpty;
}

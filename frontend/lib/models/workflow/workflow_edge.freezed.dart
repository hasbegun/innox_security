// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkflowEdge _$WorkflowEdgeFromJson(Map<String, dynamic> json) {
  return _WorkflowEdge.fromJson(json);
}

/// @nodoc
mixin _$WorkflowEdge {
  @JsonKey(name: 'edge_id')
  String get edgeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_id')
  String get sourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_id')
  String get targetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'edge_type')
  WorkflowEdgeType get edgeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_preview')
  String get contentPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_content')
  String get fullContent => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkflowEdgeCopyWith<WorkflowEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowEdgeCopyWith<$Res> {
  factory $WorkflowEdgeCopyWith(
          WorkflowEdge value, $Res Function(WorkflowEdge) then) =
      _$WorkflowEdgeCopyWithImpl<$Res, WorkflowEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'edge_id') String edgeId,
      @JsonKey(name: 'source_id') String sourceId,
      @JsonKey(name: 'target_id') String targetId,
      @JsonKey(name: 'edge_type') WorkflowEdgeType edgeType,
      @JsonKey(name: 'content_preview') String contentPreview,
      @JsonKey(name: 'full_content') String fullContent,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$WorkflowEdgeCopyWithImpl<$Res, $Val extends WorkflowEdge>
    implements $WorkflowEdgeCopyWith<$Res> {
  _$WorkflowEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edgeId = null,
    Object? sourceId = null,
    Object? targetId = null,
    Object? edgeType = null,
    Object? contentPreview = null,
    Object? fullContent = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      edgeId: null == edgeId
          ? _value.edgeId
          : edgeId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      edgeType: null == edgeType
          ? _value.edgeType
          : edgeType // ignore: cast_nullable_to_non_nullable
              as WorkflowEdgeType,
      contentPreview: null == contentPreview
          ? _value.contentPreview
          : contentPreview // ignore: cast_nullable_to_non_nullable
              as String,
      fullContent: null == fullContent
          ? _value.fullContent
          : fullContent // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkflowEdgeImplCopyWith<$Res>
    implements $WorkflowEdgeCopyWith<$Res> {
  factory _$$WorkflowEdgeImplCopyWith(
          _$WorkflowEdgeImpl value, $Res Function(_$WorkflowEdgeImpl) then) =
      __$$WorkflowEdgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'edge_id') String edgeId,
      @JsonKey(name: 'source_id') String sourceId,
      @JsonKey(name: 'target_id') String targetId,
      @JsonKey(name: 'edge_type') WorkflowEdgeType edgeType,
      @JsonKey(name: 'content_preview') String contentPreview,
      @JsonKey(name: 'full_content') String fullContent,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$WorkflowEdgeImplCopyWithImpl<$Res>
    extends _$WorkflowEdgeCopyWithImpl<$Res, _$WorkflowEdgeImpl>
    implements _$$WorkflowEdgeImplCopyWith<$Res> {
  __$$WorkflowEdgeImplCopyWithImpl(
      _$WorkflowEdgeImpl _value, $Res Function(_$WorkflowEdgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edgeId = null,
    Object? sourceId = null,
    Object? targetId = null,
    Object? edgeType = null,
    Object? contentPreview = null,
    Object? fullContent = null,
    Object? metadata = null,
  }) {
    return _then(_$WorkflowEdgeImpl(
      edgeId: null == edgeId
          ? _value.edgeId
          : edgeId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      edgeType: null == edgeType
          ? _value.edgeType
          : edgeType // ignore: cast_nullable_to_non_nullable
              as WorkflowEdgeType,
      contentPreview: null == contentPreview
          ? _value.contentPreview
          : contentPreview // ignore: cast_nullable_to_non_nullable
              as String,
      fullContent: null == fullContent
          ? _value.fullContent
          : fullContent // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowEdgeImpl implements _WorkflowEdge {
  const _$WorkflowEdgeImpl(
      {@JsonKey(name: 'edge_id') required this.edgeId,
      @JsonKey(name: 'source_id') required this.sourceId,
      @JsonKey(name: 'target_id') required this.targetId,
      @JsonKey(name: 'edge_type') required this.edgeType,
      @JsonKey(name: 'content_preview') this.contentPreview = '',
      @JsonKey(name: 'full_content') this.fullContent = '',
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$WorkflowEdgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowEdgeImplFromJson(json);

  @override
  @JsonKey(name: 'edge_id')
  final String edgeId;
  @override
  @JsonKey(name: 'source_id')
  final String sourceId;
  @override
  @JsonKey(name: 'target_id')
  final String targetId;
  @override
  @JsonKey(name: 'edge_type')
  final WorkflowEdgeType edgeType;
  @override
  @JsonKey(name: 'content_preview')
  final String contentPreview;
  @override
  @JsonKey(name: 'full_content')
  final String fullContent;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'WorkflowEdge(edgeId: $edgeId, sourceId: $sourceId, targetId: $targetId, edgeType: $edgeType, contentPreview: $contentPreview, fullContent: $fullContent, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowEdgeImpl &&
            (identical(other.edgeId, edgeId) || other.edgeId == edgeId) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.edgeType, edgeType) ||
                other.edgeType == edgeType) &&
            (identical(other.contentPreview, contentPreview) ||
                other.contentPreview == contentPreview) &&
            (identical(other.fullContent, fullContent) ||
                other.fullContent == fullContent) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      edgeId,
      sourceId,
      targetId,
      edgeType,
      contentPreview,
      fullContent,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowEdgeImplCopyWith<_$WorkflowEdgeImpl> get copyWith =>
      __$$WorkflowEdgeImplCopyWithImpl<_$WorkflowEdgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowEdgeImplToJson(
      this,
    );
  }
}

abstract class _WorkflowEdge implements WorkflowEdge {
  const factory _WorkflowEdge(
      {@JsonKey(name: 'edge_id') required final String edgeId,
      @JsonKey(name: 'source_id') required final String sourceId,
      @JsonKey(name: 'target_id') required final String targetId,
      @JsonKey(name: 'edge_type') required final WorkflowEdgeType edgeType,
      @JsonKey(name: 'content_preview') final String contentPreview,
      @JsonKey(name: 'full_content') final String fullContent,
      final Map<String, dynamic> metadata}) = _$WorkflowEdgeImpl;

  factory _WorkflowEdge.fromJson(Map<String, dynamic> json) =
      _$WorkflowEdgeImpl.fromJson;

  @override
  @JsonKey(name: 'edge_id')
  String get edgeId;
  @override
  @JsonKey(name: 'source_id')
  String get sourceId;
  @override
  @JsonKey(name: 'target_id')
  String get targetId;
  @override
  @JsonKey(name: 'edge_type')
  WorkflowEdgeType get edgeType;
  @override
  @JsonKey(name: 'content_preview')
  String get contentPreview;
  @override
  @JsonKey(name: 'full_content')
  String get fullContent;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$WorkflowEdgeImplCopyWith<_$WorkflowEdgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

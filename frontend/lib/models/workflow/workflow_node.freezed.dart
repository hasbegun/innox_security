// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkflowNode _$WorkflowNodeFromJson(Map<String, dynamic> json) {
  return _WorkflowNode.fromJson(json);
}

/// @nodoc
mixin _$WorkflowNode {
  @JsonKey(name: 'node_id')
  String get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_type')
  WorkflowNodeType get nodeType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  double get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkflowNodeCopyWith<WorkflowNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowNodeCopyWith<$Res> {
  factory $WorkflowNodeCopyWith(
          WorkflowNode value, $Res Function(WorkflowNode) then) =
      _$WorkflowNodeCopyWithImpl<$Res, WorkflowNode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'node_type') WorkflowNodeType nodeType,
      String name,
      String? description,
      Map<String, dynamic> metadata,
      double timestamp});
}

/// @nodoc
class _$WorkflowNodeCopyWithImpl<$Res, $Val extends WorkflowNode>
    implements $WorkflowNodeCopyWith<$Res> {
  _$WorkflowNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeId = null,
    Object? nodeType = null,
    Object? name = null,
    Object? description = freezed,
    Object? metadata = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      nodeType: null == nodeType
          ? _value.nodeType
          : nodeType // ignore: cast_nullable_to_non_nullable
              as WorkflowNodeType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkflowNodeImplCopyWith<$Res>
    implements $WorkflowNodeCopyWith<$Res> {
  factory _$$WorkflowNodeImplCopyWith(
          _$WorkflowNodeImpl value, $Res Function(_$WorkflowNodeImpl) then) =
      __$$WorkflowNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'node_id') String nodeId,
      @JsonKey(name: 'node_type') WorkflowNodeType nodeType,
      String name,
      String? description,
      Map<String, dynamic> metadata,
      double timestamp});
}

/// @nodoc
class __$$WorkflowNodeImplCopyWithImpl<$Res>
    extends _$WorkflowNodeCopyWithImpl<$Res, _$WorkflowNodeImpl>
    implements _$$WorkflowNodeImplCopyWith<$Res> {
  __$$WorkflowNodeImplCopyWithImpl(
      _$WorkflowNodeImpl _value, $Res Function(_$WorkflowNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeId = null,
    Object? nodeType = null,
    Object? name = null,
    Object? description = freezed,
    Object? metadata = null,
    Object? timestamp = null,
  }) {
    return _then(_$WorkflowNodeImpl(
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      nodeType: null == nodeType
          ? _value.nodeType
          : nodeType // ignore: cast_nullable_to_non_nullable
              as WorkflowNodeType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowNodeImpl implements _WorkflowNode {
  const _$WorkflowNodeImpl(
      {@JsonKey(name: 'node_id') required this.nodeId,
      @JsonKey(name: 'node_type') required this.nodeType,
      required this.name,
      this.description,
      final Map<String, dynamic> metadata = const {},
      required this.timestamp})
      : _metadata = metadata;

  factory _$WorkflowNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowNodeImplFromJson(json);

  @override
  @JsonKey(name: 'node_id')
  final String nodeId;
  @override
  @JsonKey(name: 'node_type')
  final WorkflowNodeType nodeType;
  @override
  final String name;
  @override
  final String? description;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final double timestamp;

  @override
  String toString() {
    return 'WorkflowNode(nodeId: $nodeId, nodeType: $nodeType, name: $name, description: $description, metadata: $metadata, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowNodeImpl &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.nodeType, nodeType) ||
                other.nodeType == nodeType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nodeId, nodeType, name,
      description, const DeepCollectionEquality().hash(_metadata), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowNodeImplCopyWith<_$WorkflowNodeImpl> get copyWith =>
      __$$WorkflowNodeImplCopyWithImpl<_$WorkflowNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowNodeImplToJson(
      this,
    );
  }
}

abstract class _WorkflowNode implements WorkflowNode {
  const factory _WorkflowNode(
      {@JsonKey(name: 'node_id') required final String nodeId,
      @JsonKey(name: 'node_type') required final WorkflowNodeType nodeType,
      required final String name,
      final String? description,
      final Map<String, dynamic> metadata,
      required final double timestamp}) = _$WorkflowNodeImpl;

  factory _WorkflowNode.fromJson(Map<String, dynamic> json) =
      _$WorkflowNodeImpl.fromJson;

  @override
  @JsonKey(name: 'node_id')
  String get nodeId;
  @override
  @JsonKey(name: 'node_type')
  WorkflowNodeType get nodeType;
  @override
  String get name;
  @override
  String? get description;
  @override
  Map<String, dynamic> get metadata;
  @override
  double get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$WorkflowNodeImplCopyWith<_$WorkflowNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

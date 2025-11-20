// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkflowGraph _$WorkflowGraphFromJson(Map<String, dynamic> json) {
  return _WorkflowGraph.fromJson(json);
}

/// @nodoc
mixin _$WorkflowGraph {
  @JsonKey(name: 'scan_id')
  String get scanId => throw _privateConstructorUsedError;
  List<WorkflowNode> get nodes => throw _privateConstructorUsedError;
  List<WorkflowEdge> get edges => throw _privateConstructorUsedError;
  Map<String, dynamic> get statistics => throw _privateConstructorUsedError;
  @JsonKey(name: 'layout_hints')
  Map<String, dynamic> get layoutHints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkflowGraphCopyWith<WorkflowGraph> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowGraphCopyWith<$Res> {
  factory $WorkflowGraphCopyWith(
          WorkflowGraph value, $Res Function(WorkflowGraph) then) =
      _$WorkflowGraphCopyWithImpl<$Res, WorkflowGraph>;
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_id') String scanId,
      List<WorkflowNode> nodes,
      List<WorkflowEdge> edges,
      Map<String, dynamic> statistics,
      @JsonKey(name: 'layout_hints') Map<String, dynamic> layoutHints});
}

/// @nodoc
class _$WorkflowGraphCopyWithImpl<$Res, $Val extends WorkflowGraph>
    implements $WorkflowGraphCopyWith<$Res> {
  _$WorkflowGraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanId = null,
    Object? nodes = null,
    Object? edges = null,
    Object? statistics = null,
    Object? layoutHints = null,
  }) {
    return _then(_value.copyWith(
      scanId: null == scanId
          ? _value.scanId
          : scanId // ignore: cast_nullable_to_non_nullable
              as String,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<WorkflowNode>,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<WorkflowEdge>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      layoutHints: null == layoutHints
          ? _value.layoutHints
          : layoutHints // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkflowGraphImplCopyWith<$Res>
    implements $WorkflowGraphCopyWith<$Res> {
  factory _$$WorkflowGraphImplCopyWith(
          _$WorkflowGraphImpl value, $Res Function(_$WorkflowGraphImpl) then) =
      __$$WorkflowGraphImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_id') String scanId,
      List<WorkflowNode> nodes,
      List<WorkflowEdge> edges,
      Map<String, dynamic> statistics,
      @JsonKey(name: 'layout_hints') Map<String, dynamic> layoutHints});
}

/// @nodoc
class __$$WorkflowGraphImplCopyWithImpl<$Res>
    extends _$WorkflowGraphCopyWithImpl<$Res, _$WorkflowGraphImpl>
    implements _$$WorkflowGraphImplCopyWith<$Res> {
  __$$WorkflowGraphImplCopyWithImpl(
      _$WorkflowGraphImpl _value, $Res Function(_$WorkflowGraphImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanId = null,
    Object? nodes = null,
    Object? edges = null,
    Object? statistics = null,
    Object? layoutHints = null,
  }) {
    return _then(_$WorkflowGraphImpl(
      scanId: null == scanId
          ? _value.scanId
          : scanId // ignore: cast_nullable_to_non_nullable
              as String,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<WorkflowNode>,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<WorkflowEdge>,
      statistics: null == statistics
          ? _value._statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      layoutHints: null == layoutHints
          ? _value._layoutHints
          : layoutHints // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowGraphImpl extends _WorkflowGraph {
  const _$WorkflowGraphImpl(
      {@JsonKey(name: 'scan_id') required this.scanId,
      final List<WorkflowNode> nodes = const [],
      final List<WorkflowEdge> edges = const [],
      final Map<String, dynamic> statistics = const {},
      @JsonKey(name: 'layout_hints')
      final Map<String, dynamic> layoutHints = const {}})
      : _nodes = nodes,
        _edges = edges,
        _statistics = statistics,
        _layoutHints = layoutHints,
        super._();

  factory _$WorkflowGraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowGraphImplFromJson(json);

  @override
  @JsonKey(name: 'scan_id')
  final String scanId;
  final List<WorkflowNode> _nodes;
  @override
  @JsonKey()
  List<WorkflowNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  final List<WorkflowEdge> _edges;
  @override
  @JsonKey()
  List<WorkflowEdge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  final Map<String, dynamic> _statistics;
  @override
  @JsonKey()
  Map<String, dynamic> get statistics {
    if (_statistics is EqualUnmodifiableMapView) return _statistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statistics);
  }

  final Map<String, dynamic> _layoutHints;
  @override
  @JsonKey(name: 'layout_hints')
  Map<String, dynamic> get layoutHints {
    if (_layoutHints is EqualUnmodifiableMapView) return _layoutHints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_layoutHints);
  }

  @override
  String toString() {
    return 'WorkflowGraph(scanId: $scanId, nodes: $nodes, edges: $edges, statistics: $statistics, layoutHints: $layoutHints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowGraphImpl &&
            (identical(other.scanId, scanId) || other.scanId == scanId) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            const DeepCollectionEquality().equals(other._edges, _edges) &&
            const DeepCollectionEquality()
                .equals(other._statistics, _statistics) &&
            const DeepCollectionEquality()
                .equals(other._layoutHints, _layoutHints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scanId,
      const DeepCollectionEquality().hash(_nodes),
      const DeepCollectionEquality().hash(_edges),
      const DeepCollectionEquality().hash(_statistics),
      const DeepCollectionEquality().hash(_layoutHints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowGraphImplCopyWith<_$WorkflowGraphImpl> get copyWith =>
      __$$WorkflowGraphImplCopyWithImpl<_$WorkflowGraphImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowGraphImplToJson(
      this,
    );
  }
}

abstract class _WorkflowGraph extends WorkflowGraph {
  const factory _WorkflowGraph(
      {@JsonKey(name: 'scan_id') required final String scanId,
      final List<WorkflowNode> nodes,
      final List<WorkflowEdge> edges,
      final Map<String, dynamic> statistics,
      @JsonKey(name: 'layout_hints')
      final Map<String, dynamic> layoutHints}) = _$WorkflowGraphImpl;
  const _WorkflowGraph._() : super._();

  factory _WorkflowGraph.fromJson(Map<String, dynamic> json) =
      _$WorkflowGraphImpl.fromJson;

  @override
  @JsonKey(name: 'scan_id')
  String get scanId;
  @override
  List<WorkflowNode> get nodes;
  @override
  List<WorkflowEdge> get edges;
  @override
  Map<String, dynamic> get statistics;
  @override
  @JsonKey(name: 'layout_hints')
  Map<String, dynamic> get layoutHints;
  @override
  @JsonKey(ignore: true)
  _$$WorkflowGraphImplCopyWith<_$WorkflowGraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) {
  return _ScoreModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreModel {
  String get id => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  int get currentScore => throw _privateConstructorUsedError;
  int get totalShared => throw _privateConstructorUsedError;
  int get totalReceived => throw _privateConstructorUsedError;
  int get totalCompleted => throw _privateConstructorUsedError;
  int get totalCancelled => throw _privateConstructorUsedError;
  DateTime get lastUpdatedAt => throw _privateConstructorUsedError;
  List<ScoreHistoryModel>? get history => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreModelCopyWith<ScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreModelCopyWith<$Res> {
  factory $ScoreModelCopyWith(
          ScoreModel value, $Res Function(ScoreModel) then) =
      _$ScoreModelCopyWithImpl<$Res, ScoreModel>;
  @useResult
  $Res call(
      {String id,
      String driverId,
      int currentScore,
      int totalShared,
      int totalReceived,
      int totalCompleted,
      int totalCancelled,
      DateTime lastUpdatedAt,
      List<ScoreHistoryModel>? history});
}

/// @nodoc
class _$ScoreModelCopyWithImpl<$Res, $Val extends ScoreModel>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? currentScore = null,
    Object? totalShared = null,
    Object? totalReceived = null,
    Object? totalCompleted = null,
    Object? totalCancelled = null,
    Object? lastUpdatedAt = null,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalShared: null == totalShared
          ? _value.totalShared
          : totalShared // ignore: cast_nullable_to_non_nullable
              as int,
      totalReceived: null == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompleted: null == totalCompleted
          ? _value.totalCompleted
          : totalCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalCancelled: null == totalCancelled
          ? _value.totalCancelled
          : totalCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<ScoreHistoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreModelImplCopyWith<$Res>
    implements $ScoreModelCopyWith<$Res> {
  factory _$$ScoreModelImplCopyWith(
          _$ScoreModelImpl value, $Res Function(_$ScoreModelImpl) then) =
      __$$ScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String driverId,
      int currentScore,
      int totalShared,
      int totalReceived,
      int totalCompleted,
      int totalCancelled,
      DateTime lastUpdatedAt,
      List<ScoreHistoryModel>? history});
}

/// @nodoc
class __$$ScoreModelImplCopyWithImpl<$Res>
    extends _$ScoreModelCopyWithImpl<$Res, _$ScoreModelImpl>
    implements _$$ScoreModelImplCopyWith<$Res> {
  __$$ScoreModelImplCopyWithImpl(
      _$ScoreModelImpl _value, $Res Function(_$ScoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? currentScore = null,
    Object? totalShared = null,
    Object? totalReceived = null,
    Object? totalCompleted = null,
    Object? totalCancelled = null,
    Object? lastUpdatedAt = null,
    Object? history = freezed,
  }) {
    return _then(_$ScoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalShared: null == totalShared
          ? _value.totalShared
          : totalShared // ignore: cast_nullable_to_non_nullable
              as int,
      totalReceived: null == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompleted: null == totalCompleted
          ? _value.totalCompleted
          : totalCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalCancelled: null == totalCancelled
          ? _value.totalCancelled
          : totalCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      history: freezed == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<ScoreHistoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreModelImpl implements _ScoreModel {
  const _$ScoreModelImpl(
      {required this.id,
      required this.driverId,
      required this.currentScore,
      required this.totalShared,
      required this.totalReceived,
      required this.totalCompleted,
      required this.totalCancelled,
      required this.lastUpdatedAt,
      final List<ScoreHistoryModel>? history})
      : _history = history;

  factory _$ScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreModelImplFromJson(json);

  @override
  final String id;
  @override
  final String driverId;
  @override
  final int currentScore;
  @override
  final int totalShared;
  @override
  final int totalReceived;
  @override
  final int totalCompleted;
  @override
  final int totalCancelled;
  @override
  final DateTime lastUpdatedAt;
  final List<ScoreHistoryModel>? _history;
  @override
  List<ScoreHistoryModel>? get history {
    final value = _history;
    if (value == null) return null;
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScoreModel(id: $id, driverId: $driverId, currentScore: $currentScore, totalShared: $totalShared, totalReceived: $totalReceived, totalCompleted: $totalCompleted, totalCancelled: $totalCancelled, lastUpdatedAt: $lastUpdatedAt, history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.currentScore, currentScore) ||
                other.currentScore == currentScore) &&
            (identical(other.totalShared, totalShared) ||
                other.totalShared == totalShared) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalCompleted, totalCompleted) ||
                other.totalCompleted == totalCompleted) &&
            (identical(other.totalCancelled, totalCancelled) ||
                other.totalCancelled == totalCancelled) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driverId,
      currentScore,
      totalShared,
      totalReceived,
      totalCompleted,
      totalCancelled,
      lastUpdatedAt,
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      __$$ScoreModelImplCopyWithImpl<_$ScoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreModelImplToJson(
      this,
    );
  }
}

abstract class _ScoreModel implements ScoreModel {
  const factory _ScoreModel(
      {required final String id,
      required final String driverId,
      required final int currentScore,
      required final int totalShared,
      required final int totalReceived,
      required final int totalCompleted,
      required final int totalCancelled,
      required final DateTime lastUpdatedAt,
      final List<ScoreHistoryModel>? history}) = _$ScoreModelImpl;

  factory _ScoreModel.fromJson(Map<String, dynamic> json) =
      _$ScoreModelImpl.fromJson;

  @override
  String get id;
  @override
  String get driverId;
  @override
  int get currentScore;
  @override
  int get totalShared;
  @override
  int get totalReceived;
  @override
  int get totalCompleted;
  @override
  int get totalCancelled;
  @override
  DateTime get lastUpdatedAt;
  @override
  List<ScoreHistoryModel>? get history;
  @override
  @JsonKey(ignore: true)
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScoreHistoryModel _$ScoreHistoryModelFromJson(Map<String, dynamic> json) {
  return _ScoreHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreHistoryModel {
  String get id => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  int get scoreChange => throw _privateConstructorUsedError;
  ScoreAction get action => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get relatedId =>
      throw _privateConstructorUsedError; // customerId or rideId
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreHistoryModelCopyWith<ScoreHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreHistoryModelCopyWith<$Res> {
  factory $ScoreHistoryModelCopyWith(
          ScoreHistoryModel value, $Res Function(ScoreHistoryModel) then) =
      _$ScoreHistoryModelCopyWithImpl<$Res, ScoreHistoryModel>;
  @useResult
  $Res call(
      {String id,
      String driverId,
      int scoreChange,
      ScoreAction action,
      String description,
      String? relatedId,
      DateTime createdAt});
}

/// @nodoc
class _$ScoreHistoryModelCopyWithImpl<$Res, $Val extends ScoreHistoryModel>
    implements $ScoreHistoryModelCopyWith<$Res> {
  _$ScoreHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? scoreChange = null,
    Object? action = null,
    Object? description = null,
    Object? relatedId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      scoreChange: null == scoreChange
          ? _value.scoreChange
          : scoreChange // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ScoreAction,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreHistoryModelImplCopyWith<$Res>
    implements $ScoreHistoryModelCopyWith<$Res> {
  factory _$$ScoreHistoryModelImplCopyWith(_$ScoreHistoryModelImpl value,
          $Res Function(_$ScoreHistoryModelImpl) then) =
      __$$ScoreHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String driverId,
      int scoreChange,
      ScoreAction action,
      String description,
      String? relatedId,
      DateTime createdAt});
}

/// @nodoc
class __$$ScoreHistoryModelImplCopyWithImpl<$Res>
    extends _$ScoreHistoryModelCopyWithImpl<$Res, _$ScoreHistoryModelImpl>
    implements _$$ScoreHistoryModelImplCopyWith<$Res> {
  __$$ScoreHistoryModelImplCopyWithImpl(_$ScoreHistoryModelImpl _value,
      $Res Function(_$ScoreHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? scoreChange = null,
    Object? action = null,
    Object? description = null,
    Object? relatedId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ScoreHistoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      scoreChange: null == scoreChange
          ? _value.scoreChange
          : scoreChange // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ScoreAction,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreHistoryModelImpl implements _ScoreHistoryModel {
  const _$ScoreHistoryModelImpl(
      {required this.id,
      required this.driverId,
      required this.scoreChange,
      required this.action,
      required this.description,
      this.relatedId,
      required this.createdAt});

  factory _$ScoreHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreHistoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String driverId;
  @override
  final int scoreChange;
  @override
  final ScoreAction action;
  @override
  final String description;
  @override
  final String? relatedId;
// customerId or rideId
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ScoreHistoryModel(id: $id, driverId: $driverId, scoreChange: $scoreChange, action: $action, description: $description, relatedId: $relatedId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreHistoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.scoreChange, scoreChange) ||
                other.scoreChange == scoreChange) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.relatedId, relatedId) ||
                other.relatedId == relatedId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, driverId, scoreChange,
      action, description, relatedId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreHistoryModelImplCopyWith<_$ScoreHistoryModelImpl> get copyWith =>
      __$$ScoreHistoryModelImplCopyWithImpl<_$ScoreHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _ScoreHistoryModel implements ScoreHistoryModel {
  const factory _ScoreHistoryModel(
      {required final String id,
      required final String driverId,
      required final int scoreChange,
      required final ScoreAction action,
      required final String description,
      final String? relatedId,
      required final DateTime createdAt}) = _$ScoreHistoryModelImpl;

  factory _ScoreHistoryModel.fromJson(Map<String, dynamic> json) =
      _$ScoreHistoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get driverId;
  @override
  int get scoreChange;
  @override
  ScoreAction get action;
  @override
  String get description;
  @override
  String? get relatedId;
  @override // customerId or rideId
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ScoreHistoryModelImplCopyWith<_$ScoreHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

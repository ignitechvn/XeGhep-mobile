// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreHistory _$ScoreHistoryFromJson(Map<String, dynamic> json) {
  return _ScoreHistory.fromJson(json);
}

/// @nodoc
mixin _$ScoreHistory {
  String get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'post_customer', 'claim_customer', 'complete_ride', 'penalty'
  int get points =>
      throw _privateConstructorUsedError; // +1, -1, +50, -10, etc.
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'completed', 'pending', 'cancelled'
  String? get relatedId =>
      throw _privateConstructorUsedError; // customer_id, ride_id, etc.
  String? get relatedType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreHistoryCopyWith<ScoreHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreHistoryCopyWith<$Res> {
  factory $ScoreHistoryCopyWith(
          ScoreHistory value, $Res Function(ScoreHistory) then) =
      _$ScoreHistoryCopyWithImpl<$Res, ScoreHistory>;
  @useResult
  $Res call(
      {String id,
      String type,
      int points,
      String description,
      DateTime createdAt,
      String status,
      String? relatedId,
      String? relatedType});
}

/// @nodoc
class _$ScoreHistoryCopyWithImpl<$Res, $Val extends ScoreHistory>
    implements $ScoreHistoryCopyWith<$Res> {
  _$ScoreHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? description = null,
    Object? createdAt = null,
    Object? status = null,
    Object? relatedId = freezed,
    Object? relatedType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedType: freezed == relatedType
          ? _value.relatedType
          : relatedType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreHistoryImplCopyWith<$Res>
    implements $ScoreHistoryCopyWith<$Res> {
  factory _$$ScoreHistoryImplCopyWith(
          _$ScoreHistoryImpl value, $Res Function(_$ScoreHistoryImpl) then) =
      __$$ScoreHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      int points,
      String description,
      DateTime createdAt,
      String status,
      String? relatedId,
      String? relatedType});
}

/// @nodoc
class __$$ScoreHistoryImplCopyWithImpl<$Res>
    extends _$ScoreHistoryCopyWithImpl<$Res, _$ScoreHistoryImpl>
    implements _$$ScoreHistoryImplCopyWith<$Res> {
  __$$ScoreHistoryImplCopyWithImpl(
      _$ScoreHistoryImpl _value, $Res Function(_$ScoreHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? points = null,
    Object? description = null,
    Object? createdAt = null,
    Object? status = null,
    Object? relatedId = freezed,
    Object? relatedType = freezed,
  }) {
    return _then(_$ScoreHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedType: freezed == relatedType
          ? _value.relatedType
          : relatedType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreHistoryImpl implements _ScoreHistory {
  const _$ScoreHistoryImpl(
      {required this.id,
      required this.type,
      required this.points,
      required this.description,
      required this.createdAt,
      required this.status,
      this.relatedId,
      this.relatedType});

  factory _$ScoreHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
// 'post_customer', 'claim_customer', 'complete_ride', 'penalty'
  @override
  final int points;
// +1, -1, +50, -10, etc.
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final String status;
// 'completed', 'pending', 'cancelled'
  @override
  final String? relatedId;
// customer_id, ride_id, etc.
  @override
  final String? relatedType;

  @override
  String toString() {
    return 'ScoreHistory(id: $id, type: $type, points: $points, description: $description, createdAt: $createdAt, status: $status, relatedId: $relatedId, relatedType: $relatedType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.relatedId, relatedId) ||
                other.relatedId == relatedId) &&
            (identical(other.relatedType, relatedType) ||
                other.relatedType == relatedType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, points, description,
      createdAt, status, relatedId, relatedType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreHistoryImplCopyWith<_$ScoreHistoryImpl> get copyWith =>
      __$$ScoreHistoryImplCopyWithImpl<_$ScoreHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreHistoryImplToJson(
      this,
    );
  }
}

abstract class _ScoreHistory implements ScoreHistory {
  const factory _ScoreHistory(
      {required final String id,
      required final String type,
      required final int points,
      required final String description,
      required final DateTime createdAt,
      required final String status,
      final String? relatedId,
      final String? relatedType}) = _$ScoreHistoryImpl;

  factory _ScoreHistory.fromJson(Map<String, dynamic> json) =
      _$ScoreHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override // 'post_customer', 'claim_customer', 'complete_ride', 'penalty'
  int get points;
  @override // +1, -1, +50, -10, etc.
  String get description;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override // 'completed', 'pending', 'cancelled'
  String? get relatedId;
  @override // customer_id, ride_id, etc.
  String? get relatedType;
  @override
  @JsonKey(ignore: true)
  _$$ScoreHistoryImplCopyWith<_$ScoreHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

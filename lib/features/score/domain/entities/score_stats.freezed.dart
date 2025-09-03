// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreStats _$ScoreStatsFromJson(Map<String, dynamic> json) {
  return _ScoreStats.fromJson(json);
}

/// @nodoc
mixin _$ScoreStats {
  int get currentScore => throw _privateConstructorUsedError;
  int get totalPosts => throw _privateConstructorUsedError;
  int get totalClaims => throw _privateConstructorUsedError;
  int get totalCompletions => throw _privateConstructorUsedError;
  int get totalPenalties => throw _privateConstructorUsedError;
  double get successRate => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get bestStreak => throw _privateConstructorUsedError;
  int get quotaUsed => throw _privateConstructorUsedError;
  int get quotaLimit => throw _privateConstructorUsedError;
  String get level =>
      throw _privateConstructorUsedError; // 'Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond'
  int get pointsToNextLevel => throw _privateConstructorUsedError;
  DateTime get lastActivity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreStatsCopyWith<ScoreStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreStatsCopyWith<$Res> {
  factory $ScoreStatsCopyWith(
          ScoreStats value, $Res Function(ScoreStats) then) =
      _$ScoreStatsCopyWithImpl<$Res, ScoreStats>;
  @useResult
  $Res call(
      {int currentScore,
      int totalPosts,
      int totalClaims,
      int totalCompletions,
      int totalPenalties,
      double successRate,
      int currentStreak,
      int bestStreak,
      int quotaUsed,
      int quotaLimit,
      String level,
      int pointsToNextLevel,
      DateTime lastActivity});
}

/// @nodoc
class _$ScoreStatsCopyWithImpl<$Res, $Val extends ScoreStats>
    implements $ScoreStatsCopyWith<$Res> {
  _$ScoreStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScore = null,
    Object? totalPosts = null,
    Object? totalClaims = null,
    Object? totalCompletions = null,
    Object? totalPenalties = null,
    Object? successRate = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? quotaUsed = null,
    Object? quotaLimit = null,
    Object? level = null,
    Object? pointsToNextLevel = null,
    Object? lastActivity = null,
  }) {
    return _then(_value.copyWith(
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalPosts: null == totalPosts
          ? _value.totalPosts
          : totalPosts // ignore: cast_nullable_to_non_nullable
              as int,
      totalClaims: null == totalClaims
          ? _value.totalClaims
          : totalClaims // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      totalPenalties: null == totalPenalties
          ? _value.totalPenalties
          : totalPenalties // ignore: cast_nullable_to_non_nullable
              as int,
      successRate: null == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      quotaUsed: null == quotaUsed
          ? _value.quotaUsed
          : quotaUsed // ignore: cast_nullable_to_non_nullable
              as int,
      quotaLimit: null == quotaLimit
          ? _value.quotaLimit
          : quotaLimit // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreStatsImplCopyWith<$Res>
    implements $ScoreStatsCopyWith<$Res> {
  factory _$$ScoreStatsImplCopyWith(
          _$ScoreStatsImpl value, $Res Function(_$ScoreStatsImpl) then) =
      __$$ScoreStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentScore,
      int totalPosts,
      int totalClaims,
      int totalCompletions,
      int totalPenalties,
      double successRate,
      int currentStreak,
      int bestStreak,
      int quotaUsed,
      int quotaLimit,
      String level,
      int pointsToNextLevel,
      DateTime lastActivity});
}

/// @nodoc
class __$$ScoreStatsImplCopyWithImpl<$Res>
    extends _$ScoreStatsCopyWithImpl<$Res, _$ScoreStatsImpl>
    implements _$$ScoreStatsImplCopyWith<$Res> {
  __$$ScoreStatsImplCopyWithImpl(
      _$ScoreStatsImpl _value, $Res Function(_$ScoreStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScore = null,
    Object? totalPosts = null,
    Object? totalClaims = null,
    Object? totalCompletions = null,
    Object? totalPenalties = null,
    Object? successRate = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? quotaUsed = null,
    Object? quotaLimit = null,
    Object? level = null,
    Object? pointsToNextLevel = null,
    Object? lastActivity = null,
  }) {
    return _then(_$ScoreStatsImpl(
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalPosts: null == totalPosts
          ? _value.totalPosts
          : totalPosts // ignore: cast_nullable_to_non_nullable
              as int,
      totalClaims: null == totalClaims
          ? _value.totalClaims
          : totalClaims // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      totalPenalties: null == totalPenalties
          ? _value.totalPenalties
          : totalPenalties // ignore: cast_nullable_to_non_nullable
              as int,
      successRate: null == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      quotaUsed: null == quotaUsed
          ? _value.quotaUsed
          : quotaUsed // ignore: cast_nullable_to_non_nullable
              as int,
      quotaLimit: null == quotaLimit
          ? _value.quotaLimit
          : quotaLimit // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      pointsToNextLevel: null == pointsToNextLevel
          ? _value.pointsToNextLevel
          : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreStatsImpl implements _ScoreStats {
  const _$ScoreStatsImpl(
      {required this.currentScore,
      required this.totalPosts,
      required this.totalClaims,
      required this.totalCompletions,
      required this.totalPenalties,
      required this.successRate,
      required this.currentStreak,
      required this.bestStreak,
      required this.quotaUsed,
      required this.quotaLimit,
      required this.level,
      required this.pointsToNextLevel,
      required this.lastActivity});

  factory _$ScoreStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreStatsImplFromJson(json);

  @override
  final int currentScore;
  @override
  final int totalPosts;
  @override
  final int totalClaims;
  @override
  final int totalCompletions;
  @override
  final int totalPenalties;
  @override
  final double successRate;
  @override
  final int currentStreak;
  @override
  final int bestStreak;
  @override
  final int quotaUsed;
  @override
  final int quotaLimit;
  @override
  final String level;
// 'Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond'
  @override
  final int pointsToNextLevel;
  @override
  final DateTime lastActivity;

  @override
  String toString() {
    return 'ScoreStats(currentScore: $currentScore, totalPosts: $totalPosts, totalClaims: $totalClaims, totalCompletions: $totalCompletions, totalPenalties: $totalPenalties, successRate: $successRate, currentStreak: $currentStreak, bestStreak: $bestStreak, quotaUsed: $quotaUsed, quotaLimit: $quotaLimit, level: $level, pointsToNextLevel: $pointsToNextLevel, lastActivity: $lastActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreStatsImpl &&
            (identical(other.currentScore, currentScore) ||
                other.currentScore == currentScore) &&
            (identical(other.totalPosts, totalPosts) ||
                other.totalPosts == totalPosts) &&
            (identical(other.totalClaims, totalClaims) ||
                other.totalClaims == totalClaims) &&
            (identical(other.totalCompletions, totalCompletions) ||
                other.totalCompletions == totalCompletions) &&
            (identical(other.totalPenalties, totalPenalties) ||
                other.totalPenalties == totalPenalties) &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.bestStreak, bestStreak) ||
                other.bestStreak == bestStreak) &&
            (identical(other.quotaUsed, quotaUsed) ||
                other.quotaUsed == quotaUsed) &&
            (identical(other.quotaLimit, quotaLimit) ||
                other.quotaLimit == quotaLimit) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.pointsToNextLevel, pointsToNextLevel) ||
                other.pointsToNextLevel == pointsToNextLevel) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentScore,
      totalPosts,
      totalClaims,
      totalCompletions,
      totalPenalties,
      successRate,
      currentStreak,
      bestStreak,
      quotaUsed,
      quotaLimit,
      level,
      pointsToNextLevel,
      lastActivity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreStatsImplCopyWith<_$ScoreStatsImpl> get copyWith =>
      __$$ScoreStatsImplCopyWithImpl<_$ScoreStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreStatsImplToJson(
      this,
    );
  }
}

abstract class _ScoreStats implements ScoreStats {
  const factory _ScoreStats(
      {required final int currentScore,
      required final int totalPosts,
      required final int totalClaims,
      required final int totalCompletions,
      required final int totalPenalties,
      required final double successRate,
      required final int currentStreak,
      required final int bestStreak,
      required final int quotaUsed,
      required final int quotaLimit,
      required final String level,
      required final int pointsToNextLevel,
      required final DateTime lastActivity}) = _$ScoreStatsImpl;

  factory _ScoreStats.fromJson(Map<String, dynamic> json) =
      _$ScoreStatsImpl.fromJson;

  @override
  int get currentScore;
  @override
  int get totalPosts;
  @override
  int get totalClaims;
  @override
  int get totalCompletions;
  @override
  int get totalPenalties;
  @override
  double get successRate;
  @override
  int get currentStreak;
  @override
  int get bestStreak;
  @override
  int get quotaUsed;
  @override
  int get quotaLimit;
  @override
  String get level;
  @override // 'Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond'
  int get pointsToNextLevel;
  @override
  DateTime get lastActivity;
  @override
  @JsonKey(ignore: true)
  _$$ScoreStatsImplCopyWith<_$ScoreStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

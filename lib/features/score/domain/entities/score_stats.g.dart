// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreStatsImpl _$$ScoreStatsImplFromJson(Map<String, dynamic> json) =>
    _$ScoreStatsImpl(
      currentScore: (json['currentScore'] as num).toInt(),
      totalPosts: (json['totalPosts'] as num).toInt(),
      totalClaims: (json['totalClaims'] as num).toInt(),
      totalCompletions: (json['totalCompletions'] as num).toInt(),
      totalPenalties: (json['totalPenalties'] as num).toInt(),
      successRate: (json['successRate'] as num).toDouble(),
      currentStreak: (json['currentStreak'] as num).toInt(),
      bestStreak: (json['bestStreak'] as num).toInt(),
      quotaUsed: (json['quotaUsed'] as num).toInt(),
      quotaLimit: (json['quotaLimit'] as num).toInt(),
      level: json['level'] as String,
      pointsToNextLevel: (json['pointsToNextLevel'] as num).toInt(),
      lastActivity: DateTime.parse(json['lastActivity'] as String),
    );

Map<String, dynamic> _$$ScoreStatsImplToJson(_$ScoreStatsImpl instance) =>
    <String, dynamic>{
      'currentScore': instance.currentScore,
      'totalPosts': instance.totalPosts,
      'totalClaims': instance.totalClaims,
      'totalCompletions': instance.totalCompletions,
      'totalPenalties': instance.totalPenalties,
      'successRate': instance.successRate,
      'currentStreak': instance.currentStreak,
      'bestStreak': instance.bestStreak,
      'quotaUsed': instance.quotaUsed,
      'quotaLimit': instance.quotaLimit,
      'level': instance.level,
      'pointsToNextLevel': instance.pointsToNextLevel,
      'lastActivity': instance.lastActivity.toIso8601String(),
    };

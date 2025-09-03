import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_stats.freezed.dart';
part 'score_stats.g.dart';

@freezed
class ScoreStats with _$ScoreStats {
  const factory ScoreStats({
    required int currentScore,
    required int totalPosts,
    required int totalClaims,
    required int totalCompletions,
    required int totalPenalties,
    required double successRate,
    required int currentStreak,
    required int bestStreak,
    required int quotaUsed,
    required int quotaLimit,
    required String level, // 'Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond'
    required int pointsToNextLevel,
    required DateTime lastActivity,
  }) = _ScoreStats;

  factory ScoreStats.fromJson(Map<String, dynamic> json) =>
      _$ScoreStatsFromJson(json);
}


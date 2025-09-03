import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_history.freezed.dart';
part 'score_history.g.dart';

@freezed
class ScoreHistory with _$ScoreHistory {
  const factory ScoreHistory({
    required String id,
    required String type, // 'post_customer', 'claim_customer', 'complete_ride', 'penalty'
    required int points, // +1, -1, +50, -10, etc.
    required String description,
    required DateTime createdAt,
    required String status, // 'completed', 'pending', 'cancelled'
    String? relatedId, // customer_id, ride_id, etc.
    String? relatedType, // 'customer', 'ride', etc.
  }) = _ScoreHistory;

  factory ScoreHistory.fromJson(Map<String, dynamic> json) =>
      _$ScoreHistoryFromJson(json);
}


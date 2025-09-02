import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_model.freezed.dart';
part 'score_model.g.dart';

@freezed
class ScoreModel with _$ScoreModel {
  const factory ScoreModel({
    required String id,
    required String driverId,
    required int currentScore,
    required int totalShared,
    required int totalReceived,
    required int totalCompleted,
    required int totalCancelled,
    required DateTime lastUpdatedAt,
    List<ScoreHistoryModel>? history,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);
}

@freezed
class ScoreHistoryModel with _$ScoreHistoryModel {
  const factory ScoreHistoryModel({
    required String id,
    required String driverId,
    required int scoreChange,
    required ScoreAction action,
    required String description,
    String? relatedId, // customerId or rideId
    required DateTime createdAt,
  }) = _ScoreHistoryModel;

  factory ScoreHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreHistoryModelFromJson(json);
}

enum ScoreAction {
  @JsonValue('SHARE_CUSTOMER')
  shareCustomer,
  @JsonValue('RECEIVE_CUSTOMER')
  receiveCustomer,
  @JsonValue('COMPLETE_RIDE')
  completeRide,
  @JsonValue('CANCEL_RIDE')
  cancelRide,
  @JsonValue('PENALTY')
  penalty,
  @JsonValue('BONUS')
  bonus,
  @JsonValue('ADMIN_ADJUSTMENT')
  adminAdjustment,
}

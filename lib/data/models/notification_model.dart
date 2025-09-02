import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String body,
    required NotificationType type,
    required String driverId,
    String? customerId,
    String? rideId,
    Map<String, dynamic>? data,
    required bool isRead,
    required DateTime createdAt,
    DateTime? readAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

enum NotificationType {
  @JsonValue('NEW_CUSTOMER')
  newCustomer,
  @JsonValue('RIDE_ASSIGNED')
  rideAssigned,
  @JsonValue('RIDE_REMINDER')
  rideReminder,
  @JsonValue('SCORE_UPDATE')
  scoreUpdate,
  @JsonValue('SYSTEM_ALERT')
  systemAlert,
  @JsonValue('PENALTY_WARNING')
  penaltyWarning,
  @JsonValue('BONUS_EARNED')
  bonusEarned,
}

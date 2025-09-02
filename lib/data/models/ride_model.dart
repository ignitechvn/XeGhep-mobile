import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_model.freezed.dart';
part 'ride_model.g.dart';

@freezed
class RideModel with _$RideModel {
  const factory RideModel({
    required String id,
    required String customerId,
    required String driverId,
    required String pickupLocation,
    required String dropoffLocation,
    required DateTime pickupTime,
    required DateTime scheduledTime,
    required RideStatus status,
    required int seatCount,
    String? notes,
    String? cancellationReason,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
    RideRating? rating,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _RideModel;

  factory RideModel.fromJson(Map<String, dynamic> json) =>
      _$RideModelFromJson(json);
}

@freezed
class RideRating with _$RideRating {
  const factory RideRating({
    required int rating,
    String? comment,
    required DateTime ratedAt,
  }) = _RideRating;

  factory RideRating.fromJson(Map<String, dynamic> json) =>
      _$RideRatingFromJson(json);
}

enum RideStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('ASSIGNED')
  assigned,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}

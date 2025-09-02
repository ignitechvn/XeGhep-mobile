import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required String id,
    required String name,
    required String phoneNumber,
    required String pickupLocation,
    required String dropoffLocation,
    required DateTime pickupTime,
    required int seatCount,
    String? notes,
    required CustomerStatus status,
    required String postedByDriverId,
    String? assignedToDriverId,
    DateTime? assignedAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

@freezed
class CustomerPostModel with _$CustomerPostModel {
  const factory CustomerPostModel({
    required String name,
    required String phoneNumber,
    required String pickupLocation,
    required String dropoffLocation,
    required DateTime pickupTime,
    required int seatCount,
    String? notes,
  }) = _CustomerPostModel;

  factory CustomerPostModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerPostModelFromJson(json);
}

enum CustomerStatus {
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

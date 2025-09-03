import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';

part 'ride.freezed.dart';
part 'ride.g.dart';

@freezed
class Ride with _$Ride {
  const factory Ride({
    required String id,
    required String postId,
    required String driverId,
    required String driverName,
    required String customerId,
    required String customerName,
    required String customerPhone, // Will be masked in UI
    required DetailedAddress fromLocation,
    required DetailedAddress toLocation,
    required DateTime scheduledTime,
    DateTime? actualStartTime,
    DateTime? actualEndTime,
    required int seatsNeeded,
    required double price,
    required double distance,
    required String status, // 'pending', 'confirmed', 'in_progress', 'completed', 'cancelled'
    required DateTime createdAt,
    required DateTime updatedAt,
    String? notes,
    String? cancellationReason,
    double? rating, // Customer rating for the ride
    String? feedback, // Customer feedback
  }) = _Ride;

  const Ride._();

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

  // Helper methods
  bool get isPending => status == 'pending';
  bool get isConfirmed => status == 'confirmed';
  bool get isInProgress => status == 'in_progress';
  bool get isCompleted => status == 'completed';
  bool get isCancelled => status == 'cancelled';
  
  bool get canStart => isConfirmed;
  bool get canComplete => isInProgress;
  bool get canCancel => isPending || isConfirmed;
  
  String get statusText {
    switch (status) {
      case 'pending':
        return 'Chờ xác nhận';
      case 'confirmed':
        return 'Đã xác nhận';
      case 'in_progress':
        return 'Đang thực hiện';
      case 'completed':
        return 'Đã hoàn thành';
      case 'cancelled':
        return 'Đã hủy';
      default:
        return 'Không xác định';
    }
  }
  
  String get maskedCustomerPhone {
    if (customerPhone.length <= 4) return customerPhone;
    final visible = customerPhone.substring(customerPhone.length - 4);
    return '***$visible';
  }
}

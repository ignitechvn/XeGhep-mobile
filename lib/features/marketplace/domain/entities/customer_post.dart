import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';

part 'customer_post.freezed.dart';
part 'customer_post.g.dart';

@freezed
class CustomerPost with _$CustomerPost {
  const factory CustomerPost({
    required String id,
    required String driverId,
    required String driverName,
    required double driverRating,
    required DetailedAddress fromLocation,
    required DetailedAddress toLocation,
    required DateTime departureTime,
    required int seatsNeeded,
    required double price,
    required double distance,
    required String status, // 'available', 'claimed', 'completed', 'cancelled'
    required DateTime createdAt,
    required DateTime expiresAt,
    required int interestedCount,
    String? description,
    String? vehicleType,
    String? licensePlate,
  }) = _CustomerPost;

  factory CustomerPost.fromJson(Map<String, dynamic> json) =>
      _$CustomerPostFromJson(json);
}

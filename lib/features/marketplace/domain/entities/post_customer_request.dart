import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';

part 'post_customer_request.freezed.dart';
part 'post_customer_request.g.dart';

@freezed
class PostCustomerRequest with _$PostCustomerRequest {
  const factory PostCustomerRequest({
    required DetailedAddress fromLocation,
    required DetailedAddress toLocation,
    required DateTime departureTime,
    required int seatsNeeded,
    required double price,
    required double distance,
    String? description,
    String? vehicleType,
    String? licensePlate,
    String? ticketImageUrl,
  }) = _PostCustomerRequest;

  factory PostCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$PostCustomerRequestFromJson(json);
}

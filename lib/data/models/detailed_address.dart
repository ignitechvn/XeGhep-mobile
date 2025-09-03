import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_address.freezed.dart';
part 'detailed_address.g.dart';

@freezed
class DetailedAddress with _$DetailedAddress {
  const factory DetailedAddress({
    required String street, // Số nhà, tên đường
    String? ward, // Phường/Xã
    String? village, // Thôn/Khu phố
    required String district, // Quận/Huyện
    required String city, // Thành phố/Tỉnh
    required double latitude,
    required double longitude,
    String? landmark, // Địa danh nổi bật gần đó
    String? note, // Ghi chú thêm
  }) = _DetailedAddress;

  const DetailedAddress._();

  factory DetailedAddress.fromJson(Map<String, dynamic> json) =>
      _$DetailedAddressFromJson(json);

  // Helper method to get full address string
  String get fullAddress {
    final parts = <String>[];
    
    if (street.isNotEmpty) parts.add(street);
    if (ward != null && ward!.isNotEmpty) parts.add(ward!);
    if (village != null && village!.isNotEmpty) parts.add(village!);
    if (district.isNotEmpty) parts.add(district);
    if (city.isNotEmpty) parts.add(city);
    
    return parts.join(', ');
  }

  // Helper method to get short address (district, city only)
  String get shortAddress {
    final parts = <String>[];
    if (district.isNotEmpty) parts.add(district);
    if (city.isNotEmpty) parts.add(city);
    return parts.join(', ');
  }

  // Helper method to get detailed address with landmark
  String get detailedAddress {
    final parts = <String>[];
    
    if (street.isNotEmpty) parts.add(street);
    if (ward != null && ward!.isNotEmpty) parts.add(ward!);
    if (village != null && village!.isNotEmpty) parts.add(village!);
    if (district.isNotEmpty) parts.add(district);
    if (city.isNotEmpty) parts.add(city);
    
    final address = parts.join(', ');
    
    if (landmark != null && landmark!.isNotEmpty) {
      return '$address (gần $landmark)';
    }
    
    return address;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String phoneNumber,
    required String fullName,
    required String email,
    String? avatar,
    required UserRole role,
    required UserStatus status,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? lastLoginAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class DriverModel with _$DriverModel {
  const factory DriverModel({
    required String id,
    required String userId,
    required String licenseNumber,
    required String vehicleType,
    required String vehiclePlate,
    required String vehicleModel,
    required String vehicleColor,
    required int currentScore,
    required int totalShared,
    required int totalReceived,
    required DriverStatus status,
    required bool isOnline,
    List<String>? favoriteRoutes,
    DateTime? lastActiveAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}

enum UserRole {
  @JsonValue('DRIVER')
  driver,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('CUSTOMER')
  customer,
}

enum UserStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('SUSPENDED')
  suspended,
  @JsonValue('PENDING_VERIFICATION')
  pendingVerification,
}

enum DriverStatus {
  @JsonValue('AVAILABLE')
  available,
  @JsonValue('BUSY')
  busy,
  @JsonValue('OFFLINE')
  offline,
  @JsonValue('SUSPENDED')
  suspended,
}

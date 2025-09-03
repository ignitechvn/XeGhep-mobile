// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerPostImpl _$$CustomerPostImplFromJson(Map<String, dynamic> json) =>
    _$CustomerPostImpl(
      id: json['id'] as String,
      driverId: json['driverId'] as String,
      driverName: json['driverName'] as String,
      driverRating: (json['driverRating'] as num).toDouble(),
      fromLocation: DetailedAddress.fromJson(
          json['fromLocation'] as Map<String, dynamic>),
      toLocation:
          DetailedAddress.fromJson(json['toLocation'] as Map<String, dynamic>),
      departureTime: DateTime.parse(json['departureTime'] as String),
      seatsNeeded: (json['seatsNeeded'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      interestedCount: (json['interestedCount'] as num).toInt(),
      description: json['description'] as String?,
      vehicleType: json['vehicleType'] as String?,
      licensePlate: json['licensePlate'] as String?,
    );

Map<String, dynamic> _$$CustomerPostImplToJson(_$CustomerPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverRating': instance.driverRating,
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'departureTime': instance.departureTime.toIso8601String(),
      'seatsNeeded': instance.seatsNeeded,
      'price': instance.price,
      'distance': instance.distance,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'interestedCount': instance.interestedCount,
      'description': instance.description,
      'vehicleType': instance.vehicleType,
      'licensePlate': instance.licensePlate,
    };

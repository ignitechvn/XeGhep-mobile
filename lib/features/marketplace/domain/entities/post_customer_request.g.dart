// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostCustomerRequestImpl _$$PostCustomerRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PostCustomerRequestImpl(
      fromLocation: DetailedAddress.fromJson(
          json['fromLocation'] as Map<String, dynamic>),
      toLocation:
          DetailedAddress.fromJson(json['toLocation'] as Map<String, dynamic>),
      departureTime: DateTime.parse(json['departureTime'] as String),
      seatsNeeded: (json['seatsNeeded'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      description: json['description'] as String?,
      vehicleType: json['vehicleType'] as String?,
      licensePlate: json['licensePlate'] as String?,
      ticketImageUrl: json['ticketImageUrl'] as String?,
    );

Map<String, dynamic> _$$PostCustomerRequestImplToJson(
        _$PostCustomerRequestImpl instance) =>
    <String, dynamic>{
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'departureTime': instance.departureTime.toIso8601String(),
      'seatsNeeded': instance.seatsNeeded,
      'price': instance.price,
      'distance': instance.distance,
      'description': instance.description,
      'vehicleType': instance.vehicleType,
      'licensePlate': instance.licensePlate,
      'ticketImageUrl': instance.ticketImageUrl,
    };

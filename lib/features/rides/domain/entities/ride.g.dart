// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideImpl _$$RideImplFromJson(Map<String, dynamic> json) => _$RideImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      driverId: json['driverId'] as String,
      driverName: json['driverName'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      fromLocation: DetailedAddress.fromJson(
          json['fromLocation'] as Map<String, dynamic>),
      toLocation:
          DetailedAddress.fromJson(json['toLocation'] as Map<String, dynamic>),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      actualEndTime: json['actualEndTime'] == null
          ? null
          : DateTime.parse(json['actualEndTime'] as String),
      seatsNeeded: (json['seatsNeeded'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      notes: json['notes'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$$RideImplToJson(_$RideImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'actualStartTime': instance.actualStartTime?.toIso8601String(),
      'actualEndTime': instance.actualEndTime?.toIso8601String(),
      'seatsNeeded': instance.seatsNeeded,
      'price': instance.price,
      'distance': instance.distance,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'notes': instance.notes,
      'cancellationReason': instance.cancellationReason,
      'rating': instance.rating,
      'feedback': instance.feedback,
    };

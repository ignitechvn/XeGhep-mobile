// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pickupLocation: json['pickupLocation'] as String,
      dropoffLocation: json['dropoffLocation'] as String,
      pickupTime: DateTime.parse(json['pickupTime'] as String),
      seatCount: (json['seatCount'] as num).toInt(),
      notes: json['notes'] as String?,
      status: $enumDecode(_$CustomerStatusEnumMap, json['status']),
      postedByDriverId: json['postedByDriverId'] as String,
      assignedToDriverId: json['assignedToDriverId'] as String?,
      assignedAt: json['assignedAt'] == null
          ? null
          : DateTime.parse(json['assignedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pickupLocation': instance.pickupLocation,
      'dropoffLocation': instance.dropoffLocation,
      'pickupTime': instance.pickupTime.toIso8601String(),
      'seatCount': instance.seatCount,
      'notes': instance.notes,
      'status': _$CustomerStatusEnumMap[instance.status]!,
      'postedByDriverId': instance.postedByDriverId,
      'assignedToDriverId': instance.assignedToDriverId,
      'assignedAt': instance.assignedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$CustomerStatusEnumMap = {
  CustomerStatus.pending: 'PENDING',
  CustomerStatus.assigned: 'ASSIGNED',
  CustomerStatus.inProgress: 'IN_PROGRESS',
  CustomerStatus.completed: 'COMPLETED',
  CustomerStatus.cancelled: 'CANCELLED',
};

_$CustomerPostModelImpl _$$CustomerPostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPostModelImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pickupLocation: json['pickupLocation'] as String,
      dropoffLocation: json['dropoffLocation'] as String,
      pickupTime: DateTime.parse(json['pickupTime'] as String),
      seatCount: (json['seatCount'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$CustomerPostModelImplToJson(
        _$CustomerPostModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pickupLocation': instance.pickupLocation,
      'dropoffLocation': instance.dropoffLocation,
      'pickupTime': instance.pickupTime.toIso8601String(),
      'seatCount': instance.seatCount,
      'notes': instance.notes,
    };

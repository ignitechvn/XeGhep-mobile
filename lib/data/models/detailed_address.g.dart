// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailedAddressImpl _$$DetailedAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailedAddressImpl(
      street: json['street'] as String,
      ward: json['ward'] as String?,
      village: json['village'] as String?,
      district: json['district'] as String,
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      landmark: json['landmark'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$DetailedAddressImplToJson(
        _$DetailedAddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'ward': instance.ward,
      'village': instance.village,
      'district': instance.district,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'landmark': instance.landmark,
      'note': instance.note,
    };

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailedAddress _$DetailedAddressFromJson(Map<String, dynamic> json) {
  return _DetailedAddress.fromJson(json);
}

/// @nodoc
mixin _$DetailedAddress {
  String get street => throw _privateConstructorUsedError; // Số nhà, tên đường
  String? get ward => throw _privateConstructorUsedError; // Phường/Xã
  String? get village => throw _privateConstructorUsedError; // Thôn/Khu phố
  String get district => throw _privateConstructorUsedError; // Quận/Huyện
  String get city => throw _privateConstructorUsedError; // Thành phố/Tỉnh
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get landmark =>
      throw _privateConstructorUsedError; // Địa danh nổi bật gần đó
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedAddressCopyWith<DetailedAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedAddressCopyWith<$Res> {
  factory $DetailedAddressCopyWith(
          DetailedAddress value, $Res Function(DetailedAddress) then) =
      _$DetailedAddressCopyWithImpl<$Res, DetailedAddress>;
  @useResult
  $Res call(
      {String street,
      String? ward,
      String? village,
      String district,
      String city,
      double latitude,
      double longitude,
      String? landmark,
      String? note});
}

/// @nodoc
class _$DetailedAddressCopyWithImpl<$Res, $Val extends DetailedAddress>
    implements $DetailedAddressCopyWith<$Res> {
  _$DetailedAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? ward = freezed,
    Object? village = freezed,
    Object? district = null,
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmark = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String?,
      village: freezed == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String?,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailedAddressImplCopyWith<$Res>
    implements $DetailedAddressCopyWith<$Res> {
  factory _$$DetailedAddressImplCopyWith(_$DetailedAddressImpl value,
          $Res Function(_$DetailedAddressImpl) then) =
      __$$DetailedAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String? ward,
      String? village,
      String district,
      String city,
      double latitude,
      double longitude,
      String? landmark,
      String? note});
}

/// @nodoc
class __$$DetailedAddressImplCopyWithImpl<$Res>
    extends _$DetailedAddressCopyWithImpl<$Res, _$DetailedAddressImpl>
    implements _$$DetailedAddressImplCopyWith<$Res> {
  __$$DetailedAddressImplCopyWithImpl(
      _$DetailedAddressImpl _value, $Res Function(_$DetailedAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? ward = freezed,
    Object? village = freezed,
    Object? district = null,
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmark = freezed,
    Object? note = freezed,
  }) {
    return _then(_$DetailedAddressImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String?,
      village: freezed == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String?,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedAddressImpl extends _DetailedAddress {
  const _$DetailedAddressImpl(
      {required this.street,
      this.ward,
      this.village,
      required this.district,
      required this.city,
      required this.latitude,
      required this.longitude,
      this.landmark,
      this.note})
      : super._();

  factory _$DetailedAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedAddressImplFromJson(json);

  @override
  final String street;
// Số nhà, tên đường
  @override
  final String? ward;
// Phường/Xã
  @override
  final String? village;
// Thôn/Khu phố
  @override
  final String district;
// Quận/Huyện
  @override
  final String city;
// Thành phố/Tỉnh
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? landmark;
// Địa danh nổi bật gần đó
  @override
  final String? note;

  @override
  String toString() {
    return 'DetailedAddress(street: $street, ward: $ward, village: $village, district: $district, city: $city, latitude: $latitude, longitude: $longitude, landmark: $landmark, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedAddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.village, village) || other.village == village) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, street, ward, village, district,
      city, latitude, longitude, landmark, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedAddressImplCopyWith<_$DetailedAddressImpl> get copyWith =>
      __$$DetailedAddressImplCopyWithImpl<_$DetailedAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedAddressImplToJson(
      this,
    );
  }
}

abstract class _DetailedAddress extends DetailedAddress {
  const factory _DetailedAddress(
      {required final String street,
      final String? ward,
      final String? village,
      required final String district,
      required final String city,
      required final double latitude,
      required final double longitude,
      final String? landmark,
      final String? note}) = _$DetailedAddressImpl;
  const _DetailedAddress._() : super._();

  factory _DetailedAddress.fromJson(Map<String, dynamic> json) =
      _$DetailedAddressImpl.fromJson;

  @override
  String get street;
  @override // Số nhà, tên đường
  String? get ward;
  @override // Phường/Xã
  String? get village;
  @override // Thôn/Khu phố
  String get district;
  @override // Quận/Huyện
  String get city;
  @override // Thành phố/Tỉnh
  double get latitude;
  @override
  double get longitude;
  @override
  String? get landmark;
  @override // Địa danh nổi bật gần đó
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$DetailedAddressImplCopyWith<_$DetailedAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

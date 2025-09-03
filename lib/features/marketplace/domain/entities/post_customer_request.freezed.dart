// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_customer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostCustomerRequest _$PostCustomerRequestFromJson(Map<String, dynamic> json) {
  return _PostCustomerRequest.fromJson(json);
}

/// @nodoc
mixin _$PostCustomerRequest {
  DetailedAddress get fromLocation => throw _privateConstructorUsedError;
  DetailedAddress get toLocation => throw _privateConstructorUsedError;
  DateTime get departureTime => throw _privateConstructorUsedError;
  int get seatsNeeded => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get vehicleType => throw _privateConstructorUsedError;
  String? get licensePlate => throw _privateConstructorUsedError;
  String? get ticketImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCustomerRequestCopyWith<PostCustomerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCustomerRequestCopyWith<$Res> {
  factory $PostCustomerRequestCopyWith(
          PostCustomerRequest value, $Res Function(PostCustomerRequest) then) =
      _$PostCustomerRequestCopyWithImpl<$Res, PostCustomerRequest>;
  @useResult
  $Res call(
      {DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime departureTime,
      int seatsNeeded,
      double price,
      double distance,
      String? description,
      String? vehicleType,
      String? licensePlate,
      String? ticketImageUrl});

  $DetailedAddressCopyWith<$Res> get fromLocation;
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class _$PostCustomerRequestCopyWithImpl<$Res, $Val extends PostCustomerRequest>
    implements $PostCustomerRequestCopyWith<$Res> {
  _$PostCustomerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? departureTime = null,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? description = freezed,
    Object? vehicleType = freezed,
    Object? licensePlate = freezed,
    Object? ticketImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seatsNeeded: null == seatsNeeded
          ? _value.seatsNeeded
          : seatsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketImageUrl: freezed == ticketImageUrl
          ? _value.ticketImageUrl
          : ticketImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailedAddressCopyWith<$Res> get fromLocation {
    return $DetailedAddressCopyWith<$Res>(_value.fromLocation, (value) {
      return _then(_value.copyWith(fromLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailedAddressCopyWith<$Res> get toLocation {
    return $DetailedAddressCopyWith<$Res>(_value.toLocation, (value) {
      return _then(_value.copyWith(toLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostCustomerRequestImplCopyWith<$Res>
    implements $PostCustomerRequestCopyWith<$Res> {
  factory _$$PostCustomerRequestImplCopyWith(_$PostCustomerRequestImpl value,
          $Res Function(_$PostCustomerRequestImpl) then) =
      __$$PostCustomerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime departureTime,
      int seatsNeeded,
      double price,
      double distance,
      String? description,
      String? vehicleType,
      String? licensePlate,
      String? ticketImageUrl});

  @override
  $DetailedAddressCopyWith<$Res> get fromLocation;
  @override
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class __$$PostCustomerRequestImplCopyWithImpl<$Res>
    extends _$PostCustomerRequestCopyWithImpl<$Res, _$PostCustomerRequestImpl>
    implements _$$PostCustomerRequestImplCopyWith<$Res> {
  __$$PostCustomerRequestImplCopyWithImpl(_$PostCustomerRequestImpl _value,
      $Res Function(_$PostCustomerRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? departureTime = null,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? description = freezed,
    Object? vehicleType = freezed,
    Object? licensePlate = freezed,
    Object? ticketImageUrl = freezed,
  }) {
    return _then(_$PostCustomerRequestImpl(
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seatsNeeded: null == seatsNeeded
          ? _value.seatsNeeded
          : seatsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      licensePlate: freezed == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketImageUrl: freezed == ticketImageUrl
          ? _value.ticketImageUrl
          : ticketImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostCustomerRequestImpl implements _PostCustomerRequest {
  const _$PostCustomerRequestImpl(
      {required this.fromLocation,
      required this.toLocation,
      required this.departureTime,
      required this.seatsNeeded,
      required this.price,
      required this.distance,
      this.description,
      this.vehicleType,
      this.licensePlate,
      this.ticketImageUrl});

  factory _$PostCustomerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostCustomerRequestImplFromJson(json);

  @override
  final DetailedAddress fromLocation;
  @override
  final DetailedAddress toLocation;
  @override
  final DateTime departureTime;
  @override
  final int seatsNeeded;
  @override
  final double price;
  @override
  final double distance;
  @override
  final String? description;
  @override
  final String? vehicleType;
  @override
  final String? licensePlate;
  @override
  final String? ticketImageUrl;

  @override
  String toString() {
    return 'PostCustomerRequest(fromLocation: $fromLocation, toLocation: $toLocation, departureTime: $departureTime, seatsNeeded: $seatsNeeded, price: $price, distance: $distance, description: $description, vehicleType: $vehicleType, licensePlate: $licensePlate, ticketImageUrl: $ticketImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCustomerRequestImpl &&
            (identical(other.fromLocation, fromLocation) ||
                other.fromLocation == fromLocation) &&
            (identical(other.toLocation, toLocation) ||
                other.toLocation == toLocation) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.seatsNeeded, seatsNeeded) ||
                other.seatsNeeded == seatsNeeded) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.ticketImageUrl, ticketImageUrl) ||
                other.ticketImageUrl == ticketImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fromLocation,
      toLocation,
      departureTime,
      seatsNeeded,
      price,
      distance,
      description,
      vehicleType,
      licensePlate,
      ticketImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCustomerRequestImplCopyWith<_$PostCustomerRequestImpl> get copyWith =>
      __$$PostCustomerRequestImplCopyWithImpl<_$PostCustomerRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostCustomerRequestImplToJson(
      this,
    );
  }
}

abstract class _PostCustomerRequest implements PostCustomerRequest {
  const factory _PostCustomerRequest(
      {required final DetailedAddress fromLocation,
      required final DetailedAddress toLocation,
      required final DateTime departureTime,
      required final int seatsNeeded,
      required final double price,
      required final double distance,
      final String? description,
      final String? vehicleType,
      final String? licensePlate,
      final String? ticketImageUrl}) = _$PostCustomerRequestImpl;

  factory _PostCustomerRequest.fromJson(Map<String, dynamic> json) =
      _$PostCustomerRequestImpl.fromJson;

  @override
  DetailedAddress get fromLocation;
  @override
  DetailedAddress get toLocation;
  @override
  DateTime get departureTime;
  @override
  int get seatsNeeded;
  @override
  double get price;
  @override
  double get distance;
  @override
  String? get description;
  @override
  String? get vehicleType;
  @override
  String? get licensePlate;
  @override
  String? get ticketImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$PostCustomerRequestImplCopyWith<_$PostCustomerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerPost _$CustomerPostFromJson(Map<String, dynamic> json) {
  return _CustomerPost.fromJson(json);
}

/// @nodoc
mixin _$CustomerPost {
  String get id => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get driverName => throw _privateConstructorUsedError;
  double get driverRating => throw _privateConstructorUsedError;
  DetailedAddress get fromLocation => throw _privateConstructorUsedError;
  DetailedAddress get toLocation => throw _privateConstructorUsedError;
  DateTime get departureTime => throw _privateConstructorUsedError;
  int get seatsNeeded => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'available', 'claimed', 'completed', 'cancelled'
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  int get interestedCount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get vehicleType => throw _privateConstructorUsedError;
  String? get licensePlate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPostCopyWith<CustomerPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPostCopyWith<$Res> {
  factory $CustomerPostCopyWith(
          CustomerPost value, $Res Function(CustomerPost) then) =
      _$CustomerPostCopyWithImpl<$Res, CustomerPost>;
  @useResult
  $Res call(
      {String id,
      String driverId,
      String driverName,
      double driverRating,
      DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime departureTime,
      int seatsNeeded,
      double price,
      double distance,
      String status,
      DateTime createdAt,
      DateTime expiresAt,
      int interestedCount,
      String? description,
      String? vehicleType,
      String? licensePlate});

  $DetailedAddressCopyWith<$Res> get fromLocation;
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class _$CustomerPostCopyWithImpl<$Res, $Val extends CustomerPost>
    implements $CustomerPostCopyWith<$Res> {
  _$CustomerPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? driverName = null,
    Object? driverRating = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? departureTime = null,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? interestedCount = null,
    Object? description = freezed,
    Object? vehicleType = freezed,
    Object? licensePlate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverRating: null == driverRating
          ? _value.driverRating
          : driverRating // ignore: cast_nullable_to_non_nullable
              as double,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interestedCount: null == interestedCount
          ? _value.interestedCount
          : interestedCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$CustomerPostImplCopyWith<$Res>
    implements $CustomerPostCopyWith<$Res> {
  factory _$$CustomerPostImplCopyWith(
          _$CustomerPostImpl value, $Res Function(_$CustomerPostImpl) then) =
      __$$CustomerPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String driverId,
      String driverName,
      double driverRating,
      DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime departureTime,
      int seatsNeeded,
      double price,
      double distance,
      String status,
      DateTime createdAt,
      DateTime expiresAt,
      int interestedCount,
      String? description,
      String? vehicleType,
      String? licensePlate});

  @override
  $DetailedAddressCopyWith<$Res> get fromLocation;
  @override
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class __$$CustomerPostImplCopyWithImpl<$Res>
    extends _$CustomerPostCopyWithImpl<$Res, _$CustomerPostImpl>
    implements _$$CustomerPostImplCopyWith<$Res> {
  __$$CustomerPostImplCopyWithImpl(
      _$CustomerPostImpl _value, $Res Function(_$CustomerPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? driverName = null,
    Object? driverRating = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? departureTime = null,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? interestedCount = null,
    Object? description = freezed,
    Object? vehicleType = freezed,
    Object? licensePlate = freezed,
  }) {
    return _then(_$CustomerPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverRating: null == driverRating
          ? _value.driverRating
          : driverRating // ignore: cast_nullable_to_non_nullable
              as double,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interestedCount: null == interestedCount
          ? _value.interestedCount
          : interestedCount // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPostImpl implements _CustomerPost {
  const _$CustomerPostImpl(
      {required this.id,
      required this.driverId,
      required this.driverName,
      required this.driverRating,
      required this.fromLocation,
      required this.toLocation,
      required this.departureTime,
      required this.seatsNeeded,
      required this.price,
      required this.distance,
      required this.status,
      required this.createdAt,
      required this.expiresAt,
      required this.interestedCount,
      this.description,
      this.vehicleType,
      this.licensePlate});

  factory _$CustomerPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPostImplFromJson(json);

  @override
  final String id;
  @override
  final String driverId;
  @override
  final String driverName;
  @override
  final double driverRating;
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
  final String status;
// 'available', 'claimed', 'completed', 'cancelled'
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  final int interestedCount;
  @override
  final String? description;
  @override
  final String? vehicleType;
  @override
  final String? licensePlate;

  @override
  String toString() {
    return 'CustomerPost(id: $id, driverId: $driverId, driverName: $driverName, driverRating: $driverRating, fromLocation: $fromLocation, toLocation: $toLocation, departureTime: $departureTime, seatsNeeded: $seatsNeeded, price: $price, distance: $distance, status: $status, createdAt: $createdAt, expiresAt: $expiresAt, interestedCount: $interestedCount, description: $description, vehicleType: $vehicleType, licensePlate: $licensePlate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverRating, driverRating) ||
                other.driverRating == driverRating) &&
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.interestedCount, interestedCount) ||
                other.interestedCount == interestedCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      driverId,
      driverName,
      driverRating,
      fromLocation,
      toLocation,
      departureTime,
      seatsNeeded,
      price,
      distance,
      status,
      createdAt,
      expiresAt,
      interestedCount,
      description,
      vehicleType,
      licensePlate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPostImplCopyWith<_$CustomerPostImpl> get copyWith =>
      __$$CustomerPostImplCopyWithImpl<_$CustomerPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPostImplToJson(
      this,
    );
  }
}

abstract class _CustomerPost implements CustomerPost {
  const factory _CustomerPost(
      {required final String id,
      required final String driverId,
      required final String driverName,
      required final double driverRating,
      required final DetailedAddress fromLocation,
      required final DetailedAddress toLocation,
      required final DateTime departureTime,
      required final int seatsNeeded,
      required final double price,
      required final double distance,
      required final String status,
      required final DateTime createdAt,
      required final DateTime expiresAt,
      required final int interestedCount,
      final String? description,
      final String? vehicleType,
      final String? licensePlate}) = _$CustomerPostImpl;

  factory _CustomerPost.fromJson(Map<String, dynamic> json) =
      _$CustomerPostImpl.fromJson;

  @override
  String get id;
  @override
  String get driverId;
  @override
  String get driverName;
  @override
  double get driverRating;
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
  String get status;
  @override // 'available', 'claimed', 'completed', 'cancelled'
  DateTime get createdAt;
  @override
  DateTime get expiresAt;
  @override
  int get interestedCount;
  @override
  String? get description;
  @override
  String? get vehicleType;
  @override
  String? get licensePlate;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPostImplCopyWith<_$CustomerPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

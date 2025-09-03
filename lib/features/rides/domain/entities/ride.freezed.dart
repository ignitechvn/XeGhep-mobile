// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ride _$RideFromJson(Map<String, dynamic> json) {
  return _Ride.fromJson(json);
}

/// @nodoc
mixin _$Ride {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get driverName => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerPhone =>
      throw _privateConstructorUsedError; // Will be masked in UI
  DetailedAddress get fromLocation => throw _privateConstructorUsedError;
  DetailedAddress get toLocation => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  DateTime? get actualStartTime => throw _privateConstructorUsedError;
  DateTime? get actualEndTime => throw _privateConstructorUsedError;
  int get seatsNeeded => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'pending', 'confirmed', 'in_progress', 'completed', 'cancelled'
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  double? get rating =>
      throw _privateConstructorUsedError; // Customer rating for the ride
  String? get feedback => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RideCopyWith<Ride> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideCopyWith<$Res> {
  factory $RideCopyWith(Ride value, $Res Function(Ride) then) =
      _$RideCopyWithImpl<$Res, Ride>;
  @useResult
  $Res call(
      {String id,
      String postId,
      String driverId,
      String driverName,
      String customerId,
      String customerName,
      String customerPhone,
      DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime scheduledTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      int seatsNeeded,
      double price,
      double distance,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      String? notes,
      String? cancellationReason,
      double? rating,
      String? feedback});

  $DetailedAddressCopyWith<$Res> get fromLocation;
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class _$RideCopyWithImpl<$Res, $Val extends Ride>
    implements $RideCopyWith<$Res> {
  _$RideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? driverId = null,
    Object? driverName = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? scheduledTime = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RideImplCopyWith<$Res> implements $RideCopyWith<$Res> {
  factory _$$RideImplCopyWith(
          _$RideImpl value, $Res Function(_$RideImpl) then) =
      __$$RideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      String driverId,
      String driverName,
      String customerId,
      String customerName,
      String customerPhone,
      DetailedAddress fromLocation,
      DetailedAddress toLocation,
      DateTime scheduledTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      int seatsNeeded,
      double price,
      double distance,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      String? notes,
      String? cancellationReason,
      double? rating,
      String? feedback});

  @override
  $DetailedAddressCopyWith<$Res> get fromLocation;
  @override
  $DetailedAddressCopyWith<$Res> get toLocation;
}

/// @nodoc
class __$$RideImplCopyWithImpl<$Res>
    extends _$RideCopyWithImpl<$Res, _$RideImpl>
    implements _$$RideImplCopyWith<$Res> {
  __$$RideImplCopyWithImpl(_$RideImpl _value, $Res Function(_$RideImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? driverId = null,
    Object? driverName = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? fromLocation = null,
    Object? toLocation = null,
    Object? scheduledTime = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? seatsNeeded = null,
    Object? price = null,
    Object? distance = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_$RideImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocation: null == fromLocation
          ? _value.fromLocation
          : fromLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      toLocation: null == toLocation
          ? _value.toLocation
          : toLocation // ignore: cast_nullable_to_non_nullable
              as DetailedAddress,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideImpl extends _Ride {
  const _$RideImpl(
      {required this.id,
      required this.postId,
      required this.driverId,
      required this.driverName,
      required this.customerId,
      required this.customerName,
      required this.customerPhone,
      required this.fromLocation,
      required this.toLocation,
      required this.scheduledTime,
      this.actualStartTime,
      this.actualEndTime,
      required this.seatsNeeded,
      required this.price,
      required this.distance,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.notes,
      this.cancellationReason,
      this.rating,
      this.feedback})
      : super._();

  factory _$RideImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String driverId;
  @override
  final String driverName;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String customerPhone;
// Will be masked in UI
  @override
  final DetailedAddress fromLocation;
  @override
  final DetailedAddress toLocation;
  @override
  final DateTime scheduledTime;
  @override
  final DateTime? actualStartTime;
  @override
  final DateTime? actualEndTime;
  @override
  final int seatsNeeded;
  @override
  final double price;
  @override
  final double distance;
  @override
  final String status;
// 'pending', 'confirmed', 'in_progress', 'completed', 'cancelled'
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? notes;
  @override
  final String? cancellationReason;
  @override
  final double? rating;
// Customer rating for the ride
  @override
  final String? feedback;

  @override
  String toString() {
    return 'Ride(id: $id, postId: $postId, driverId: $driverId, driverName: $driverName, customerId: $customerId, customerName: $customerName, customerPhone: $customerPhone, fromLocation: $fromLocation, toLocation: $toLocation, scheduledTime: $scheduledTime, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, seatsNeeded: $seatsNeeded, price: $price, distance: $distance, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, cancellationReason: $cancellationReason, rating: $rating, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.fromLocation, fromLocation) ||
                other.fromLocation == fromLocation) &&
            (identical(other.toLocation, toLocation) ||
                other.toLocation == toLocation) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.seatsNeeded, seatsNeeded) ||
                other.seatsNeeded == seatsNeeded) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        postId,
        driverId,
        driverName,
        customerId,
        customerName,
        customerPhone,
        fromLocation,
        toLocation,
        scheduledTime,
        actualStartTime,
        actualEndTime,
        seatsNeeded,
        price,
        distance,
        status,
        createdAt,
        updatedAt,
        notes,
        cancellationReason,
        rating,
        feedback
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      __$$RideImplCopyWithImpl<_$RideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideImplToJson(
      this,
    );
  }
}

abstract class _Ride extends Ride {
  const factory _Ride(
      {required final String id,
      required final String postId,
      required final String driverId,
      required final String driverName,
      required final String customerId,
      required final String customerName,
      required final String customerPhone,
      required final DetailedAddress fromLocation,
      required final DetailedAddress toLocation,
      required final DateTime scheduledTime,
      final DateTime? actualStartTime,
      final DateTime? actualEndTime,
      required final int seatsNeeded,
      required final double price,
      required final double distance,
      required final String status,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? notes,
      final String? cancellationReason,
      final double? rating,
      final String? feedback}) = _$RideImpl;
  const _Ride._() : super._();

  factory _Ride.fromJson(Map<String, dynamic> json) = _$RideImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get driverId;
  @override
  String get driverName;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  String get customerPhone;
  @override // Will be masked in UI
  DetailedAddress get fromLocation;
  @override
  DetailedAddress get toLocation;
  @override
  DateTime get scheduledTime;
  @override
  DateTime? get actualStartTime;
  @override
  DateTime? get actualEndTime;
  @override
  int get seatsNeeded;
  @override
  double get price;
  @override
  double get distance;
  @override
  String get status;
  @override // 'pending', 'confirmed', 'in_progress', 'completed', 'cancelled'
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get notes;
  @override
  String? get cancellationReason;
  @override
  double? get rating;
  @override // Customer rating for the ride
  String? get feedback;
  @override
  @JsonKey(ignore: true)
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

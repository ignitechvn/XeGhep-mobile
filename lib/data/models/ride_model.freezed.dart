// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RideModel _$RideModelFromJson(Map<String, dynamic> json) {
  return _RideModel.fromJson(json);
}

/// @nodoc
mixin _$RideModel {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get pickupLocation => throw _privateConstructorUsedError;
  String get dropoffLocation => throw _privateConstructorUsedError;
  DateTime get pickupTime => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  RideStatus get status => throw _privateConstructorUsedError;
  int get seatCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  RideRating? get rating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RideModelCopyWith<RideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideModelCopyWith<$Res> {
  factory $RideModelCopyWith(RideModel value, $Res Function(RideModel) then) =
      _$RideModelCopyWithImpl<$Res, RideModel>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String driverId,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      DateTime scheduledTime,
      RideStatus status,
      int seatCount,
      String? notes,
      String? cancellationReason,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime? cancelledAt,
      RideRating? rating,
      DateTime createdAt,
      DateTime? updatedAt});

  $RideRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class _$RideModelCopyWithImpl<$Res, $Val extends RideModel>
    implements $RideModelCopyWith<$Res> {
  _$RideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? driverId = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? scheduledTime = null,
    Object? status = null,
    Object? seatCount = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? cancelledAt = freezed,
    Object? rating = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropoffLocation: null == dropoffLocation
          ? _value.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RideStatus,
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RideRating?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RideRatingCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $RideRatingCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RideModelImplCopyWith<$Res>
    implements $RideModelCopyWith<$Res> {
  factory _$$RideModelImplCopyWith(
          _$RideModelImpl value, $Res Function(_$RideModelImpl) then) =
      __$$RideModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String driverId,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      DateTime scheduledTime,
      RideStatus status,
      int seatCount,
      String? notes,
      String? cancellationReason,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime? cancelledAt,
      RideRating? rating,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $RideRatingCopyWith<$Res>? get rating;
}

/// @nodoc
class __$$RideModelImplCopyWithImpl<$Res>
    extends _$RideModelCopyWithImpl<$Res, _$RideModelImpl>
    implements _$$RideModelImplCopyWith<$Res> {
  __$$RideModelImplCopyWithImpl(
      _$RideModelImpl _value, $Res Function(_$RideModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? driverId = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? scheduledTime = null,
    Object? status = null,
    Object? seatCount = null,
    Object? notes = freezed,
    Object? cancellationReason = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? cancelledAt = freezed,
    Object? rating = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RideModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as String,
      dropoffLocation: null == dropoffLocation
          ? _value.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RideStatus,
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RideRating?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideModelImpl implements _RideModel {
  const _$RideModelImpl(
      {required this.id,
      required this.customerId,
      required this.driverId,
      required this.pickupLocation,
      required this.dropoffLocation,
      required this.pickupTime,
      required this.scheduledTime,
      required this.status,
      required this.seatCount,
      this.notes,
      this.cancellationReason,
      this.startedAt,
      this.completedAt,
      this.cancelledAt,
      this.rating,
      required this.createdAt,
      this.updatedAt});

  factory _$RideModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideModelImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final String driverId;
  @override
  final String pickupLocation;
  @override
  final String dropoffLocation;
  @override
  final DateTime pickupTime;
  @override
  final DateTime scheduledTime;
  @override
  final RideStatus status;
  @override
  final int seatCount;
  @override
  final String? notes;
  @override
  final String? cancellationReason;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? cancelledAt;
  @override
  final RideRating? rating;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RideModel(id: $id, customerId: $customerId, driverId: $driverId, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, pickupTime: $pickupTime, scheduledTime: $scheduledTime, status: $status, seatCount: $seatCount, notes: $notes, cancellationReason: $cancellationReason, startedAt: $startedAt, completedAt: $completedAt, cancelledAt: $cancelledAt, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.seatCount, seatCount) ||
                other.seatCount == seatCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      driverId,
      pickupLocation,
      dropoffLocation,
      pickupTime,
      scheduledTime,
      status,
      seatCount,
      notes,
      cancellationReason,
      startedAt,
      completedAt,
      cancelledAt,
      rating,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RideModelImplCopyWith<_$RideModelImpl> get copyWith =>
      __$$RideModelImplCopyWithImpl<_$RideModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideModelImplToJson(
      this,
    );
  }
}

abstract class _RideModel implements RideModel {
  const factory _RideModel(
      {required final String id,
      required final String customerId,
      required final String driverId,
      required final String pickupLocation,
      required final String dropoffLocation,
      required final DateTime pickupTime,
      required final DateTime scheduledTime,
      required final RideStatus status,
      required final int seatCount,
      final String? notes,
      final String? cancellationReason,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final DateTime? cancelledAt,
      final RideRating? rating,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$RideModelImpl;

  factory _RideModel.fromJson(Map<String, dynamic> json) =
      _$RideModelImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get driverId;
  @override
  String get pickupLocation;
  @override
  String get dropoffLocation;
  @override
  DateTime get pickupTime;
  @override
  DateTime get scheduledTime;
  @override
  RideStatus get status;
  @override
  int get seatCount;
  @override
  String? get notes;
  @override
  String? get cancellationReason;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get cancelledAt;
  @override
  RideRating? get rating;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RideModelImplCopyWith<_$RideModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RideRating _$RideRatingFromJson(Map<String, dynamic> json) {
  return _RideRating.fromJson(json);
}

/// @nodoc
mixin _$RideRating {
  int get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  DateTime get ratedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RideRatingCopyWith<RideRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideRatingCopyWith<$Res> {
  factory $RideRatingCopyWith(
          RideRating value, $Res Function(RideRating) then) =
      _$RideRatingCopyWithImpl<$Res, RideRating>;
  @useResult
  $Res call({int rating, String? comment, DateTime ratedAt});
}

/// @nodoc
class _$RideRatingCopyWithImpl<$Res, $Val extends RideRating>
    implements $RideRatingCopyWith<$Res> {
  _$RideRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? ratedAt = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      ratedAt: null == ratedAt
          ? _value.ratedAt
          : ratedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RideRatingImplCopyWith<$Res>
    implements $RideRatingCopyWith<$Res> {
  factory _$$RideRatingImplCopyWith(
          _$RideRatingImpl value, $Res Function(_$RideRatingImpl) then) =
      __$$RideRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rating, String? comment, DateTime ratedAt});
}

/// @nodoc
class __$$RideRatingImplCopyWithImpl<$Res>
    extends _$RideRatingCopyWithImpl<$Res, _$RideRatingImpl>
    implements _$$RideRatingImplCopyWith<$Res> {
  __$$RideRatingImplCopyWithImpl(
      _$RideRatingImpl _value, $Res Function(_$RideRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? ratedAt = null,
  }) {
    return _then(_$RideRatingImpl(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      ratedAt: null == ratedAt
          ? _value.ratedAt
          : ratedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideRatingImpl implements _RideRating {
  const _$RideRatingImpl(
      {required this.rating, this.comment, required this.ratedAt});

  factory _$RideRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideRatingImplFromJson(json);

  @override
  final int rating;
  @override
  final String? comment;
  @override
  final DateTime ratedAt;

  @override
  String toString() {
    return 'RideRating(rating: $rating, comment: $comment, ratedAt: $ratedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideRatingImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.ratedAt, ratedAt) || other.ratedAt == ratedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rating, comment, ratedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RideRatingImplCopyWith<_$RideRatingImpl> get copyWith =>
      __$$RideRatingImplCopyWithImpl<_$RideRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideRatingImplToJson(
      this,
    );
  }
}

abstract class _RideRating implements RideRating {
  const factory _RideRating(
      {required final int rating,
      final String? comment,
      required final DateTime ratedAt}) = _$RideRatingImpl;

  factory _RideRating.fromJson(Map<String, dynamic> json) =
      _$RideRatingImpl.fromJson;

  @override
  int get rating;
  @override
  String? get comment;
  @override
  DateTime get ratedAt;
  @override
  @JsonKey(ignore: true)
  _$$RideRatingImplCopyWith<_$RideRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get pickupLocation => throw _privateConstructorUsedError;
  String get dropoffLocation => throw _privateConstructorUsedError;
  DateTime get pickupTime => throw _privateConstructorUsedError;
  int get seatCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  CustomerStatus get status => throw _privateConstructorUsedError;
  String get postedByDriverId => throw _privateConstructorUsedError;
  String? get assignedToDriverId => throw _privateConstructorUsedError;
  DateTime? get assignedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      int seatCount,
      String? notes,
      CustomerStatus status,
      String postedByDriverId,
      String? assignedToDriverId,
      DateTime? assignedAt,
      DateTime? completedAt,
      DateTime? cancelledAt,
      String? cancellationReason,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? seatCount = null,
    Object? notes = freezed,
    Object? status = null,
    Object? postedByDriverId = null,
    Object? assignedToDriverId = freezed,
    Object? assignedAt = freezed,
    Object? completedAt = freezed,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStatus,
      postedByDriverId: null == postedByDriverId
          ? _value.postedByDriverId
          : postedByDriverId // ignore: cast_nullable_to_non_nullable
              as String,
      assignedToDriverId: freezed == assignedToDriverId
          ? _value.assignedToDriverId
          : assignedToDriverId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAt: freezed == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$CustomerModelImplCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$CustomerModelImplCopyWith(
          _$CustomerModelImpl value, $Res Function(_$CustomerModelImpl) then) =
      __$$CustomerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      int seatCount,
      String? notes,
      CustomerStatus status,
      String postedByDriverId,
      String? assignedToDriverId,
      DateTime? assignedAt,
      DateTime? completedAt,
      DateTime? cancelledAt,
      String? cancellationReason,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CustomerModelImplCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$CustomerModelImpl>
    implements _$$CustomerModelImplCopyWith<$Res> {
  __$$CustomerModelImplCopyWithImpl(
      _$CustomerModelImpl _value, $Res Function(_$CustomerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? seatCount = null,
    Object? notes = freezed,
    Object? status = null,
    Object? postedByDriverId = null,
    Object? assignedToDriverId = freezed,
    Object? assignedAt = freezed,
    Object? completedAt = freezed,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CustomerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CustomerStatus,
      postedByDriverId: null == postedByDriverId
          ? _value.postedByDriverId
          : postedByDriverId // ignore: cast_nullable_to_non_nullable
              as String,
      assignedToDriverId: freezed == assignedToDriverId
          ? _value.assignedToDriverId
          : assignedToDriverId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedAt: freezed == assignedAt
          ? _value.assignedAt
          : assignedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CustomerModelImpl implements _CustomerModel {
  const _$CustomerModelImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.pickupLocation,
      required this.dropoffLocation,
      required this.pickupTime,
      required this.seatCount,
      this.notes,
      required this.status,
      required this.postedByDriverId,
      this.assignedToDriverId,
      this.assignedAt,
      this.completedAt,
      this.cancelledAt,
      this.cancellationReason,
      required this.createdAt,
      this.updatedAt});

  factory _$CustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String pickupLocation;
  @override
  final String dropoffLocation;
  @override
  final DateTime pickupTime;
  @override
  final int seatCount;
  @override
  final String? notes;
  @override
  final CustomerStatus status;
  @override
  final String postedByDriverId;
  @override
  final String? assignedToDriverId;
  @override
  final DateTime? assignedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? cancelledAt;
  @override
  final String? cancellationReason;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, phoneNumber: $phoneNumber, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, pickupTime: $pickupTime, seatCount: $seatCount, notes: $notes, status: $status, postedByDriverId: $postedByDriverId, assignedToDriverId: $assignedToDriverId, assignedAt: $assignedAt, completedAt: $completedAt, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.seatCount, seatCount) ||
                other.seatCount == seatCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.postedByDriverId, postedByDriverId) ||
                other.postedByDriverId == postedByDriverId) &&
            (identical(other.assignedToDriverId, assignedToDriverId) ||
                other.assignedToDriverId == assignedToDriverId) &&
            (identical(other.assignedAt, assignedAt) ||
                other.assignedAt == assignedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
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
      name,
      phoneNumber,
      pickupLocation,
      dropoffLocation,
      pickupTime,
      seatCount,
      notes,
      status,
      postedByDriverId,
      assignedToDriverId,
      assignedAt,
      completedAt,
      cancelledAt,
      cancellationReason,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      __$$CustomerModelImplCopyWithImpl<_$CustomerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {required final String id,
      required final String name,
      required final String phoneNumber,
      required final String pickupLocation,
      required final String dropoffLocation,
      required final DateTime pickupTime,
      required final int seatCount,
      final String? notes,
      required final CustomerStatus status,
      required final String postedByDriverId,
      final String? assignedToDriverId,
      final DateTime? assignedAt,
      final DateTime? completedAt,
      final DateTime? cancelledAt,
      final String? cancellationReason,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$CustomerModelImpl;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$CustomerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get pickupLocation;
  @override
  String get dropoffLocation;
  @override
  DateTime get pickupTime;
  @override
  int get seatCount;
  @override
  String? get notes;
  @override
  CustomerStatus get status;
  @override
  String get postedByDriverId;
  @override
  String? get assignedToDriverId;
  @override
  DateTime? get assignedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get cancelledAt;
  @override
  String? get cancellationReason;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerPostModel _$CustomerPostModelFromJson(Map<String, dynamic> json) {
  return _CustomerPostModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerPostModel {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get pickupLocation => throw _privateConstructorUsedError;
  String get dropoffLocation => throw _privateConstructorUsedError;
  DateTime get pickupTime => throw _privateConstructorUsedError;
  int get seatCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPostModelCopyWith<CustomerPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPostModelCopyWith<$Res> {
  factory $CustomerPostModelCopyWith(
          CustomerPostModel value, $Res Function(CustomerPostModel) then) =
      _$CustomerPostModelCopyWithImpl<$Res, CustomerPostModel>;
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      int seatCount,
      String? notes});
}

/// @nodoc
class _$CustomerPostModelCopyWithImpl<$Res, $Val extends CustomerPostModel>
    implements $CustomerPostModelCopyWith<$Res> {
  _$CustomerPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? seatCount = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPostModelImplCopyWith<$Res>
    implements $CustomerPostModelCopyWith<$Res> {
  factory _$$CustomerPostModelImplCopyWith(_$CustomerPostModelImpl value,
          $Res Function(_$CustomerPostModelImpl) then) =
      __$$CustomerPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String pickupLocation,
      String dropoffLocation,
      DateTime pickupTime,
      int seatCount,
      String? notes});
}

/// @nodoc
class __$$CustomerPostModelImplCopyWithImpl<$Res>
    extends _$CustomerPostModelCopyWithImpl<$Res, _$CustomerPostModelImpl>
    implements _$$CustomerPostModelImplCopyWith<$Res> {
  __$$CustomerPostModelImplCopyWithImpl(_$CustomerPostModelImpl _value,
      $Res Function(_$CustomerPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupTime = null,
    Object? seatCount = null,
    Object? notes = freezed,
  }) {
    return _then(_$CustomerPostModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
      seatCount: null == seatCount
          ? _value.seatCount
          : seatCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPostModelImpl implements _CustomerPostModel {
  const _$CustomerPostModelImpl(
      {required this.name,
      required this.phoneNumber,
      required this.pickupLocation,
      required this.dropoffLocation,
      required this.pickupTime,
      required this.seatCount,
      this.notes});

  factory _$CustomerPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPostModelImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String pickupLocation;
  @override
  final String dropoffLocation;
  @override
  final DateTime pickupTime;
  @override
  final int seatCount;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CustomerPostModel(name: $name, phoneNumber: $phoneNumber, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, pickupTime: $pickupTime, seatCount: $seatCount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPostModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.seatCount, seatCount) ||
                other.seatCount == seatCount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber,
      pickupLocation, dropoffLocation, pickupTime, seatCount, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPostModelImplCopyWith<_$CustomerPostModelImpl> get copyWith =>
      __$$CustomerPostModelImplCopyWithImpl<_$CustomerPostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPostModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerPostModel implements CustomerPostModel {
  const factory _CustomerPostModel(
      {required final String name,
      required final String phoneNumber,
      required final String pickupLocation,
      required final String dropoffLocation,
      required final DateTime pickupTime,
      required final int seatCount,
      final String? notes}) = _$CustomerPostModelImpl;

  factory _CustomerPostModel.fromJson(Map<String, dynamic> json) =
      _$CustomerPostModelImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get pickupLocation;
  @override
  String get dropoffLocation;
  @override
  DateTime get pickupTime;
  @override
  int get seatCount;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPostModelImplCopyWith<_$CustomerPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

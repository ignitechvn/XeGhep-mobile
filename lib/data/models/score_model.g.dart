// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreModelImpl _$$ScoreModelImplFromJson(Map<String, dynamic> json) =>
    _$ScoreModelImpl(
      id: json['id'] as String,
      driverId: json['driverId'] as String,
      currentScore: (json['currentScore'] as num).toInt(),
      totalShared: (json['totalShared'] as num).toInt(),
      totalReceived: (json['totalReceived'] as num).toInt(),
      totalCompleted: (json['totalCompleted'] as num).toInt(),
      totalCancelled: (json['totalCancelled'] as num).toInt(),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => ScoreHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScoreModelImplToJson(_$ScoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'currentScore': instance.currentScore,
      'totalShared': instance.totalShared,
      'totalReceived': instance.totalReceived,
      'totalCompleted': instance.totalCompleted,
      'totalCancelled': instance.totalCancelled,
      'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
      'history': instance.history,
    };

_$ScoreHistoryModelImpl _$$ScoreHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreHistoryModelImpl(
      id: json['id'] as String,
      driverId: json['driverId'] as String,
      scoreChange: (json['scoreChange'] as num).toInt(),
      action: $enumDecode(_$ScoreActionEnumMap, json['action']),
      description: json['description'] as String,
      relatedId: json['relatedId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ScoreHistoryModelImplToJson(
        _$ScoreHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'scoreChange': instance.scoreChange,
      'action': _$ScoreActionEnumMap[instance.action]!,
      'description': instance.description,
      'relatedId': instance.relatedId,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ScoreActionEnumMap = {
  ScoreAction.shareCustomer: 'SHARE_CUSTOMER',
  ScoreAction.receiveCustomer: 'RECEIVE_CUSTOMER',
  ScoreAction.completeRide: 'COMPLETE_RIDE',
  ScoreAction.cancelRide: 'CANCEL_RIDE',
  ScoreAction.penalty: 'PENALTY',
  ScoreAction.bonus: 'BONUS',
  ScoreAction.adminAdjustment: 'ADMIN_ADJUSTMENT',
};

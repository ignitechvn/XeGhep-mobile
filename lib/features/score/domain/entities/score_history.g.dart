// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreHistoryImpl _$$ScoreHistoryImplFromJson(Map<String, dynamic> json) =>
    _$ScoreHistoryImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      points: (json['points'] as num).toInt(),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      relatedId: json['relatedId'] as String?,
      relatedType: json['relatedType'] as String?,
    );

Map<String, dynamic> _$$ScoreHistoryImplToJson(_$ScoreHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'points': instance.points,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'relatedId': instance.relatedId,
      'relatedType': instance.relatedType,
    };

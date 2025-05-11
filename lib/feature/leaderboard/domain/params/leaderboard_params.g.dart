// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardParams _$LeaderboardParamsFromJson(Map<String, dynamic> json) =>
    _LeaderboardParams(limit: (json['limit'] as num?)?.toInt() ?? 10);

Map<String, dynamic> _$LeaderboardParamsToJson(_LeaderboardParams instance) =>
    <String, dynamic>{'limit': instance.limit};

_UserScoreParams _$UserScoreParamsFromJson(Map<String, dynamic> json) =>
    _UserScoreParams(
      userId: json['userId'] as String,
      name: json['name'] as String,
      scoreToAdd: (json['scoreToAdd'] as num).toInt(),
      isCorrectAnswer: json['isCorrectAnswer'] as bool,
      playedAt:
          json['playedAt'] == null
              ? null
              : DateTime.parse(json['playedAt'] as String),
    );

Map<String, dynamic> _$UserScoreParamsToJson(_UserScoreParams instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'scoreToAdd': instance.scoreToAdd,
      'isCorrectAnswer': instance.isCorrectAnswer,
      'playedAt': instance.playedAt?.toIso8601String(),
    };

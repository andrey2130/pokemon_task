// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      userId: json['userId'] as String,
      name: json['name'] as String,
      score: (json['score'] as num).toInt(),
      streak: (json['streak'] as num).toInt(),
      dailyStreak: (json['dailyStreak'] as num).toInt(),
      lastPlayed: DateTime.parse(json['lastPlayed'] as String),
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'score': instance.score,
      'streak': instance.streak,
      'dailyStreak': instance.dailyStreak,
      'lastPlayed': instance.lastPlayed.toIso8601String(),
    };

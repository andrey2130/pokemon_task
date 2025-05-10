// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardState _$LeaderboardStateFromJson(Map<String, dynamic> json) =>
    _LeaderboardState(
      currentTab:
          $enumDecodeNullable(_$LeaderboardTabEnumMap, json['currentTab']) ??
          LeaderboardTab.scores,
      topScores:
          (json['topScores'] as List<dynamic>?)
              ?.map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topStreaks:
          (json['topStreaks'] as List<dynamic>?)
              ?.map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topDailyStreaks:
          (json['topDailyStreaks'] as List<dynamic>?)
              ?.map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$LeaderboardStateToJson(_LeaderboardState instance) =>
    <String, dynamic>{
      'currentTab': _$LeaderboardTabEnumMap[instance.currentTab]!,
      'topScores': instance.topScores,
      'topStreaks': instance.topStreaks,
      'topDailyStreaks': instance.topDailyStreaks,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };

const _$LeaderboardTabEnumMap = {
  LeaderboardTab.scores: 'scores',
  LeaderboardTab.streaks: 'streaks',
  LeaderboardTab.dailyStreaks: 'dailyStreaks',
};

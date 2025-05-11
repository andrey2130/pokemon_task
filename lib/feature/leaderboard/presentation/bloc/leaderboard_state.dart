import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/leaderboard_entry.dart';

part 'leaderboard_state.freezed.dart';
part 'leaderboard_state.g.dart';

enum LeaderboardTab { scores, streaks, dailyStreaks }

@freezed
abstract class LeaderboardState with _$LeaderboardState {
  const LeaderboardState._();

  const factory LeaderboardState({
    @Default(LeaderboardTab.scores) LeaderboardTab currentTab,
    @Default([]) List<LeaderboardEntry> topScores,
    @Default([]) List<LeaderboardEntry> topStreaks,
    @Default([]) List<LeaderboardEntry> topDailyStreaks,
    @Default(false) bool isLoading,
    String? error,
  }) = _LeaderboardState;

  factory LeaderboardState.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardStateFromJson(json);

  bool get isScoresTab => currentTab == LeaderboardTab.scores;
  bool get isStreaksTab => currentTab == LeaderboardTab.streaks;
  bool get isDailyStreaksTab => currentTab == LeaderboardTab.dailyStreaks;

  List<LeaderboardEntry> get currentData {
    switch (currentTab) {
      case LeaderboardTab.scores:
        return topScores;
      case LeaderboardTab.streaks:
        return topStreaks;
      case LeaderboardTab.dailyStreaks:
        return topDailyStreaks;
    }
  }
}

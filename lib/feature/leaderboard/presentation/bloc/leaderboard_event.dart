part of 'leaderboard_bloc.dart';

@freezed
abstract class LeaderboardEvent with _$LeaderboardEvent {
  const factory LeaderboardEvent.loadTopScores({@Default(10) int limit}) =
      LoadTopScores;

  const factory LeaderboardEvent.loadTopStreaks({@Default(10) int limit}) =
      LoadTopStreaks;

  const factory LeaderboardEvent.loadTopDailyStreaks({@Default(10) int limit}) =
      LoadTopDailyStreaks;

  const factory LeaderboardEvent.updateUserScore({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
  }) = UpdateUserScoreEvent;
}

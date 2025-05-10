abstract class UserStatsRepository {
  /// Updates user statistics after a guess
  Future<void> updateStats(
    int streak,
    bool isCorrect, {
    bool incrementTotalAnswers = true,
  });

  /// Increments the number of completed games for a user
  Future<void> incrementGamesPlayed();
}

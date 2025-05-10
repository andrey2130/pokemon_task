abstract class UserStatsRepository {
  /// Updates user statistics after a guess
  Future<void> updateStats(
    int streak,
    bool isCorrect, {
    bool incrementTotalAnswers = true,
  });

  /// Increments the number of completed games for a user
  Future<void> incrementGamesPlayed();

  /// Get current user basic information
  Future<UserBasicInfo?> getCurrentUserInfo();

  /// Get current user statistics
  Future<Stream<UserStats?>> getUserStatsStream();
}

/// Data class for basic user information
class UserBasicInfo {
  final String uid;
  final String email;
  final String displayName;

  UserBasicInfo({
    required this.uid,
    required this.email,
    required this.displayName,
  });
}

/// Data class for user statistics
class UserStats {
  final int bestStreak;
  final int gamesPlayed;
  final int correctAnswers;
  final int totalAnswers;
  final int dailyStreak;
  final int currentStreak;

  UserStats({
    this.bestStreak = 0,
    this.gamesPlayed = 0,
    this.correctAnswers = 0,
    this.totalAnswers = 0,
    this.dailyStreak = 0,
    this.currentStreak = 0,
  });
}

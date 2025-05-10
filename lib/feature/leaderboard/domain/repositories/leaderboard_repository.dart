import '../entities/leaderboard_entry.dart';

abstract class LeaderboardRepository {
  /// Get top scores list
  Future<List<LeaderboardEntry>> getTopScores({int limit = 10});

  /// Get top daily streaks
  Future<List<LeaderboardEntry>> getTopDailyStreaks({int limit = 10});

  /// Get top all-time streaks
  Future<List<LeaderboardEntry>> getTopStreaks({int limit = 10});

  /// Update user score and streaks
  Future<void> updateUserScore({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    required DateTime playedAt,
  });
}

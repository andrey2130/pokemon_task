import '../repositories/leaderboard_repository.dart';
import '../params/leaderboard_params.dart';

class UpdateUserScore {
  final LeaderboardRepository repository;

  UpdateUserScore(this.repository);

  Future<void> call({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    DateTime? playedAt,
  }) async {
    final params = UserScoreParams(
      userId: userId,
      name: name,
      scoreToAdd: scoreToAdd,
      isCorrectAnswer: isCorrectAnswer,
      playedAt: playedAt,
    );

    return repository.updateUserScore(
      userId: params.userId,
      name: params.name,
      scoreToAdd: params.scoreToAdd,
      isCorrectAnswer: params.isCorrectAnswer,
      playedAt: params.playedAt ?? DateTime.now(),
    );
  }
}

import '../../../../core/usecase/usecases.dart';
import '../repositories/leaderboard_repository.dart';
import '../params/leaderboard_params.dart';

class UpdateUserScoreUseCase implements UseCase<void, UserScoreParams> {
  final LeaderboardRepository repository;

  UpdateUserScoreUseCase(this.repository);

  @override
  Future<void> call(UserScoreParams params) async {
    return repository.updateUserScore(
      userId: params.userId,
      name: params.name,
      scoreToAdd: params.scoreToAdd,
      isCorrectAnswer: params.isCorrectAnswer,
      playedAt: params.playedAt ?? DateTime.now(),
    );
  }
}

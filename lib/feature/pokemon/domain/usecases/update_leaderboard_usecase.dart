import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/pokemon/domain/repositories/user_repository.dart';

class UpdateLeaderboardParams {
  final bool isCorrect;
  final int score;

  UpdateLeaderboardParams({required this.isCorrect, required this.score});
}

class UpdateLeaderboardUsecase
    implements UseCase<void, UpdateLeaderboardParams> {
  final UserRepository _userRepository;

  UpdateLeaderboardUsecase(this._userRepository);

  @override
  Future<void> call(UpdateLeaderboardParams params) async {
    await _userRepository.updateUserScore(
      score: params.score,
      isCorrect: params.isCorrect,
    );
  }

  Future<void> call2({required bool isCorrect, required int score}) async {
    return call(UpdateLeaderboardParams(isCorrect: isCorrect, score: score));
  }
}

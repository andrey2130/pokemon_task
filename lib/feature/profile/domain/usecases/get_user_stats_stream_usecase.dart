import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/profile/domain/repositories/user_stats_repository.dart';

class GetUserStatsStreamUseCase
    implements UseCase<Stream<UserStats?>, NoParams> {
  final UserStatsRepository _repository;

  GetUserStatsStreamUseCase(this._repository);

  @override
  Future<Stream<UserStats?>> call(NoParams params) {
    return _repository.getUserStatsStream();
  }
}

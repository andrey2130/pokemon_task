import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/game/domain/repositories/user_stats_repository.dart';

class GetUserInfoUseCase implements UseCase<UserBasicInfo?, NoParams> {
  final UserStatsRepository _repository;

  GetUserInfoUseCase(this._repository);

  @override
  Future<UserBasicInfo?> call(NoParams params) {
    return _repository.getCurrentUserInfo();
  }
}

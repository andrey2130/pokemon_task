import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  @override
  Future<void> call(NoParams params) {
    return authRepository.logout();
  }
}

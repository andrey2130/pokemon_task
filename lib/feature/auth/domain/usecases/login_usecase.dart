import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';

class LoginUsecase implements UseCase<Either<Failure, void>, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    return authRepository.loginWithEmailAndPassword(params);
  }
}

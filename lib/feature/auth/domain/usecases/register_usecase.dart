import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';

class RegisterUsecase
    implements UseCase<Either<Failure, UserCredential>, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserCredential>> call(RegisterParams params) {
    return authRepository.registerWithEmailAndPassword(params);
  }
}

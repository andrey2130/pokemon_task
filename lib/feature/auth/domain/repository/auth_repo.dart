import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
    RegisterParams params,
  );
  Future<Either<Failure, void>> loginWithEmailAndPassword(LoginParams params);
  Future<void> logout();
}

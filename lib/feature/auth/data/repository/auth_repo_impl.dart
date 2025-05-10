import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/auth/data/datasource/auth_datasource.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';
class AuthRepoImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepoImpl(this.authDataSource);

  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
    RegisterParams params,
  ) async {
    try {
      final userCredential = await authDataSource
          .createUserWithEmailAndPassword(params);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? 'Firebase auth error'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either> loginWithEmailAndPassword(LoginParams params) {
    // TODO: implement loginWithEmailAndPassword using authDataSource
    // Similar try-catch structure as above
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout using authDataSource
    throw UnimplementedError();
  }
}

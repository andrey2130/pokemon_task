import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/auth/data/datasource/auth_datasource.dart';
import 'package:pokemon_task/feature/auth/data/datasource/user_datasource.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final UserDataSource userDataSource;

  AuthRepoImpl(this.authDataSource, this.userDataSource);

  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
    RegisterParams params,
  ) async {
    try {
      final userCredential = await authDataSource
          .createUserWithEmailAndPassword(params);

      // Зберігаємо додаткові дані користувача в Firestore
      await userDataSource.saveUserData(userCredential.user!, params);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? 'Firebase auth error'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword(
    LoginParams params,
  ) async {
    try {
      await authDataSource.signInWithEmailAndPassword(params);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? 'Firebase auth error'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await authDataSource.signOut();
  }
}

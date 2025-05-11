import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/profile/data/datasource/user_datasource.dart';
import 'package:pokemon_task/feature/profile/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> updateUserScore({
    required int score,
    required bool isCorrect,
  }) async {
    try {
      await _dataSource.updateUserScore(score: score, isCorrect: isCorrect);
      return right(null);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getCurrentUserId() async {
    try {
      final userId = await _dataSource.getCurrentUserId();
      return right(userId);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUserName() async {
    try {
      final userName = await _dataSource.getCurrentUserName();
      return right(userName);
    } catch (e) {
      return left(Failure(message: 'Failed to get user name: ${e.toString()}'));
    }
  }
}

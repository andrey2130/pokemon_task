import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> updateUserScore({
    required int score,
    required bool isCorrect,
  });

  Future<Either<Failure, String?>> getCurrentUserId();

  Future<Either<Failure, String>> getCurrentUserName();
}

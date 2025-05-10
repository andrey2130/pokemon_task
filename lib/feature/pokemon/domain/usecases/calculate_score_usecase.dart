import 'dart:math';

import 'package:pokemon_task/core/usecase/usecases.dart';

class CalculateScoreParams {
  final bool isCorrect;
  final int timeSpent;
  final int streak;

  CalculateScoreParams({
    required this.isCorrect,
    required this.timeSpent,
    required this.streak,
  });
}

class CalculateScoreUsecase implements UseCase<int, CalculateScoreParams> {
  CalculateScoreUsecase();

  @override
  Future<int> call(CalculateScoreParams params) async {
    if (!params.isCorrect) return 0;

    // Base score for correct answer
    int baseScore = 100;

    // The faster the answer, the more points (max 100 additional points)
    int timeBonus = max(0, 100 - (params.timeSpent * 5));

    // Streak gives additional bonus
    int streakBonus = params.streak * 10; // 10 score per streak

    return baseScore + timeBonus + streakBonus;
  }

  // Додавання синтаксичного цукру для простішого виклику
  Future<int> call2({
    required bool isCorrect,
    required int timeSpent,
    required int streak,
  }) async {
    return call(
      CalculateScoreParams(
        isCorrect: isCorrect,
        timeSpent: timeSpent,
        streak: streak,
      ),
    );
  }
}

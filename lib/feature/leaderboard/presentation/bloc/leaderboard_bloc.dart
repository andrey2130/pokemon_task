import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_top_scores.dart';
import '../../domain/usecases/get_top_streaks.dart';
import '../../domain/usecases/get_top_daily_streaks.dart';
import '../../domain/usecases/update_user_score.dart';
import 'leaderboard_event.dart';
import 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final GetTopScores getTopScores;
  final GetTopStreaks getTopStreaks;
  final GetTopDailyStreaks getTopDailyStreaks;
  final UpdateUserScore updateUserScore;

  LeaderboardBloc({
    required this.getTopScores,
    required this.getTopStreaks,
    required this.getTopDailyStreaks,
    required this.updateUserScore,
  }) : super(const LeaderboardState()) {
    on<LoadTopScores>(_onLoadTopScores);
    on<LoadTopStreaks>(_onLoadTopStreaks);
    on<LoadTopDailyStreaks>(_onLoadTopDailyStreaks);
    on<UpdateUserScoreEvent>(_onUpdateUserScore);
  }

  Future<void> _onLoadTopScores(
    LoadTopScores event,
    Emitter<LeaderboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        currentTab: LeaderboardTab.scores,
        error: null,
      ),
    );

    try {
      final scores = await getTopScores(limit: event.limit);
      emit(state.copyWith(topScores: scores, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Failed to load top scores: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onLoadTopStreaks(
    LoadTopStreaks event,
    Emitter<LeaderboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        currentTab: LeaderboardTab.streaks,
        error: null,
      ),
    );

    try {
      final streaks = await getTopStreaks(limit: event.limit);
      emit(state.copyWith(topStreaks: streaks, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Failed to load top streaks: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onLoadTopDailyStreaks(
    LoadTopDailyStreaks event,
    Emitter<LeaderboardState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        currentTab: LeaderboardTab.dailyStreaks,
        error: null,
      ),
    );

    try {
      final dailyStreaks = await getTopDailyStreaks(limit: event.limit);
      emit(state.copyWith(topDailyStreaks: dailyStreaks, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Failed to load daily streaks: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onUpdateUserScore(
    UpdateUserScoreEvent event,
    Emitter<LeaderboardState> emit,
  ) async {
    try {
      await updateUserScore(
        userId: event.userId,
        name: event.name,
        scoreToAdd: event.scoreToAdd,
        isCorrectAnswer: event.isCorrectAnswer,
      );

      switch (state.currentTab) {
        case LeaderboardTab.scores:
          add(const LeaderboardEvent.loadTopScores());
          break;
        case LeaderboardTab.streaks:
          add(const LeaderboardEvent.loadTopStreaks());
          break;
        case LeaderboardTab.dailyStreaks:
          add(const LeaderboardEvent.loadTopDailyStreaks());
          break;
      }
    } catch (e) {
      emit(state.copyWith(error: 'Failed to update score: ${e.toString()}'));
    }
  }
}

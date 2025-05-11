import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/usecases/get_top_scores_usecase.dart';
import '../../domain/usecases/get_top_streaks_usecase.dart';
import '../../domain/usecases/get_top_daily_streaks_usecase.dart';
import '../../domain/usecases/update_user_score_usecase.dart';
import '../../domain/params/leaderboard_params.dart';
import '../../domain/entities/leaderboard_entry.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';
part 'leaderboard_bloc.freezed.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final GetTopScoresUseCase getTopScoresUseCase;
  final GetTopStreaksUseCase getTopStreaksUseCase;
  final GetTopDailyStreaksUseCase getTopDailyStreaksUseCase;
  final UpdateUserScoreUseCase updateUserScoreUseCase;

  LeaderboardBloc({
    required this.getTopScoresUseCase,
    required this.getTopStreaksUseCase,
    required this.getTopDailyStreaksUseCase,
    required this.updateUserScoreUseCase,
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
      final params = LeaderboardParams(limit: event.limit);
      final scores = await getTopScoresUseCase(params);
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
      final params = LeaderboardParams(limit: event.limit);
      final streaks = await getTopStreaksUseCase(params);
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
      final params = LeaderboardParams(limit: event.limit);
      final dailyStreaks = await getTopDailyStreaksUseCase(params);
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
      final params = UserScoreParams(
        userId: event.userId,
        name: event.name,
        scoreToAdd: event.scoreToAdd,
        isCorrectAnswer: event.isCorrectAnswer,
        playedAt: DateTime.now(),
      );
      await updateUserScoreUseCase(params);

      // After updating, refresh the current tab data
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

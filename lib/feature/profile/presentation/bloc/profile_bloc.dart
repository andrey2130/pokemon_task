import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/feature/profile/domain/entities/user_entity.dart';
import 'package:pokemon_task/feature/profile/domain/usecases/get_user_info_usecase.dart';
import 'package:pokemon_task/feature/profile/domain/usecases/get_user_stats_stream_usecase.dart';
import 'package:pokemon_task/core/usecase/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserInfoUseCase _getUserInfoUseCase;
  final GetUserStatsStreamUseCase _getUserStatsStreamUseCase;

  ProfileBloc(this._getUserInfoUseCase, this._getUserStatsStreamUseCase)
    : super(const ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<RefreshProfile>(_onRefreshProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    try {
      final userInfo = await _getUserInfoUseCase(NoParams());

      if (userInfo == null) {
        emit(const ProfileState.error("User not found"));
        return;
      }

      final statsStream = await _getUserStatsStreamUseCase(NoParams());

      await emit.forEach(
        statsStream,
        onData: (stats) {
          if (stats == null) {
            return const ProfileState.error("Failed to load user stats");
          }

          final user = UserEntity(
            uid: userInfo.uid,
            email: userInfo.email,
            displayName: userInfo.displayName,
            bestStreak: stats.bestStreak,
            gamesPlayed: stats.gamesPlayed,
            correctAnswers: stats.correctAnswers,
            totalAnswers: stats.totalAnswers,
            dailyStreak: stats.dailyStreak,
            currentStreak: stats.currentStreak,
          );

          return ProfileState.loaded(user);
        },
        onError: (error, _) {
          return ProfileState.error(error.toString());
        },
      );
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> _onRefreshProfile(
    RefreshProfile event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! Loaded) return;

    final currentUser = (state as Loaded).user;

    emit(ProfileState.refreshing(currentUser));

    await _onLoadProfile(const LoadProfile(), emit);
  }
}

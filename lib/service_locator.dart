import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';
import 'package:pokemon_task/feature/auth/data/datasource/auth_datasource.dart';
import 'package:pokemon_task/feature/auth/data/datasource/user_datasource.dart'
    as auth;
import 'package:pokemon_task/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';
import 'package:pokemon_task/feature/auth/domain/usecases/register_usecase.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/feature/leaderboard/data/repositories/leaderboard_repository_impl.dart';
import 'package:pokemon_task/feature/leaderboard/data/datasource/leaderboard_data_source.dart';
import 'package:pokemon_task/feature/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:pokemon_task/feature/leaderboard/domain/usecases/get_top_daily_streaks.dart';
import 'package:pokemon_task/feature/leaderboard/domain/usecases/get_top_scores.dart';
import 'package:pokemon_task/feature/leaderboard/domain/usecases/get_top_streaks.dart';
import 'package:pokemon_task/feature/leaderboard/domain/usecases/update_user_score.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:pokemon_task/feature/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokemon_task/feature/pokemon/data/datasource/user_datasource.dart';
import 'package:pokemon_task/feature/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_task/feature/pokemon/data/repository/user_repository_impl.dart';
import 'package:pokemon_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_task/feature/pokemon/domain/repositories/user_repository.dart';
import 'package:pokemon_task/feature/pokemon/domain/usecases/calculate_score_usecase.dart';
import 'package:pokemon_task/feature/pokemon/domain/usecases/get_random_pokemon_usecase.dart';
import 'package:pokemon_task/feature/pokemon/domain/usecases/update_leaderboard_usecase.dart';
import 'package:pokemon_task/feature/pokemon/presentation/bloc/pokemon_game_bloc.dart';
import 'package:pokemon_task/feature/home/data/repositories/user_stats_repository_impl.dart';
import 'package:pokemon_task/feature/home/domain/repositories/user_stats_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokemon_task/feature/home/domain/usecases/get_user_info_usecase.dart';
import 'package:pokemon_task/feature/home/domain/usecases/get_user_stats_stream_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator({required SharedPreferences prefs}) {
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // DataSources
  sl.registerSingleton<AuthDataSource>(AuthDataSourceImpl(sl<FirebaseAuth>()));
  sl.registerSingleton<auth.UserDataSource>(
    auth.UserDataSourceImpl(sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<LeaderboardDataSource>(
    () => FirebaseLeaderboardDataSource(firestore: sl()),
  );
  sl.registerSingleton<PokemonRemoteDataSource>(
    PokemonRemoteDataSourceImpl(sl<Dio>()),
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepoImpl(sl<AuthDataSource>(), sl<auth.UserDataSource>()),
  );
  sl.registerLazySingleton<LeaderboardRepository>(
    () => LeaderboardRepositoryImpl(sl<LeaderboardDataSource>()),
  );
  sl.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(sl<PokemonRemoteDataSource>()),
  );
  sl.registerLazySingleton<UserStatsRepository>(
    () => UserStatsRepositoryImpl(firestore: sl(), auth: sl()),
  );

  // UseCases
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl<AuthRepository>()));
  sl.registerLazySingleton<GetTopScores>(
    () => GetTopScores(sl<LeaderboardRepository>()),
  );
  sl.registerLazySingleton<GetTopStreaks>(
    () => GetTopStreaks(sl<LeaderboardRepository>()),
  );
  sl.registerLazySingleton<GetTopDailyStreaks>(
    () => GetTopDailyStreaks(sl<LeaderboardRepository>()),
  );
  sl.registerLazySingleton<UpdateUserScore>(
    () => UpdateUserScore(sl<LeaderboardRepository>()),
  );
  sl.registerSingleton<GetRandomPokemonUsecase>(
    GetRandomPokemonUsecase(sl<PokemonRepository>()),
  );
  sl.registerSingleton<CalculateScoreUsecase>(CalculateScoreUsecase());
  sl.registerLazySingleton<GetUserInfoUseCase>(
    () => GetUserInfoUseCase(sl<UserStatsRepository>()),
  );
  sl.registerLazySingleton<GetUserStatsStreamUseCase>(
    () => GetUserStatsStreamUseCase(sl<UserStatsRepository>()),
  );

  // Blocs
  sl.registerFactory<AuthBlocBloc>(
    () => AuthBlocBloc(sl<AuthRepository>(), sl<FirebaseAuth>()),
  );
  sl.registerFactory<LeaderboardBloc>(
    () => LeaderboardBloc(
      getTopScores: sl<GetTopScores>(),
      getTopStreaks: sl<GetTopStreaks>(),
      getTopDailyStreaks: sl<GetTopDailyStreaks>(),
      updateUserScore: sl<UpdateUserScore>(),
    ),
  );
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc(sl<SharedPreferences>()));

  sl.registerSingleton<FirebaseUserDataSource>(
    FirebaseUserDataSource(
      auth: sl<FirebaseAuth>(),
      leaderboardBloc: sl<LeaderboardBloc>(),
    ),
  );
  sl.registerSingleton<UserRepository>(
    UserRepositoryImpl(sl<FirebaseUserDataSource>()),
  );
  sl.registerSingleton<UpdateLeaderboardUsecase>(
    UpdateLeaderboardUsecase(sl<UserRepository>()),
  );
  sl.registerFactory<PokemonGameBloc>(
    () => PokemonGameBloc(
      sl<GetRandomPokemonUsecase>(),
      sl<CalculateScoreUsecase>(),
      sl<UpdateLeaderboardUsecase>(),
    ),
  );
}

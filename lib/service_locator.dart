import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_task/feature/auth/data/datasource/auth_datasource.dart';
import 'package:pokemon_task/feature/auth/data/datasource/user_datasource.dart';
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
import 'package:pokemon_task/feature/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_task/feature/pokemon/domain/usecases/get_random_pokemon_usecase.dart';
import 'package:pokemon_task/feature/pokemon/presentation/bloc/pokemon_game_bloc.dart';
import 'package:pokemon_task/feature/home/data/repositories/user_stats_repository_impl.dart';
import 'package:pokemon_task/feature/home/domain/repositories/user_stats_repository.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<Dio>(Dio());
  // sl.registerSingleton<DioClient>(DioClient());

  // Firebase Services
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Auth Feature
  // - DataSources
  sl.registerSingleton<AuthDataSource>(
    AuthDataSourceImpl(sl<FirebaseAuth>()), // Pass FirebaseAuth instance
  );
  sl.registerSingleton<UserDataSource>(
    UserDataSourceImpl(
      sl<FirebaseFirestore>(),
    ), // Pass FirebaseFirestore instance
  );

  // - Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepoImpl(
      sl<AuthDataSource>(),
      sl<UserDataSource>(),
    ), // Pass both datasources
  );

  // - Usecases
  sl.registerSingleton<RegisterUsecase>(
    RegisterUsecase(sl<AuthRepository>()), // Pass AuthRepository instance
  );

  // - Blocs
  sl.registerFactory<AuthBlocBloc>(
    () => AuthBlocBloc(sl<AuthRepository>(), sl<FirebaseAuth>()),
  );

  // Pokemon Feature
  // - DataSources
  sl.registerSingleton<PokemonRemoteDataSource>(
    PokemonRemoteDataSourceImpl(sl<Dio>()),
  );

  // - Repositories
  sl.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(sl<PokemonRemoteDataSource>()),
  );

  // - Usecases
  sl.registerSingleton<GetRandomPokemonUsecase>(
    GetRandomPokemonUsecase(sl<PokemonRepository>()),
  );

  // - Blocs
  sl.registerFactory<PokemonGameBloc>(
    () => PokemonGameBloc(
      sl<GetRandomPokemonUsecase>(),
      leaderboardBloc: sl<LeaderboardBloc>(),
      auth: sl<FirebaseAuth>(),
    ),
  );

  // Home Feature
  // - Repositories
  sl.registerLazySingleton<UserStatsRepository>(
    () => UserStatsRepositoryImpl(firestore: sl(), auth: sl()),
  );

  // Leaderboard Feature
  // - DataSource
  sl.registerLazySingleton<LeaderboardDataSource>(
    () => FirebaseLeaderboardDataSource(firestore: sl()),
  );

  // - Repositories
  sl.registerLazySingleton<LeaderboardRepository>(
    () => LeaderboardRepositoryImpl(sl<LeaderboardDataSource>()),
  );

  // - Usecases
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

  // - Blocs
  sl.registerFactory<LeaderboardBloc>(
    () => LeaderboardBloc(
      getTopScores: sl<GetTopScores>(),
      getTopStreaks: sl<GetTopStreaks>(),
      getTopDailyStreaks: sl<GetTopDailyStreaks>(),
      updateUserScore: sl<UpdateUserScore>(),
    ),
  );
}

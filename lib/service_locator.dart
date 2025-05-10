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
  
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerSingleton<AuthDataSource>(
    AuthDataSourceImpl(sl<FirebaseAuth>()),
  );
  sl.registerSingleton<UserDataSource>(
    UserDataSourceImpl(
      sl<FirebaseFirestore>(),
    ), 
  );


  sl.registerSingleton<AuthRepository>(
    AuthRepoImpl(
      sl<AuthDataSource>(),
      sl<UserDataSource>(),
    ), 
  );

  sl.registerSingleton<RegisterUsecase>(
    RegisterUsecase(sl<AuthRepository>()),
  );


  sl.registerFactory<AuthBlocBloc>(
    () => AuthBlocBloc(sl<AuthRepository>(), sl<FirebaseAuth>()),
  );

  sl.registerSingleton<PokemonRemoteDataSource>(
    PokemonRemoteDataSourceImpl(sl<Dio>()),
  );


  sl.registerSingleton<PokemonRepository>(
    PokemonRepositoryImpl(sl<PokemonRemoteDataSource>()),
  );


  sl.registerSingleton<GetRandomPokemonUsecase>(
    GetRandomPokemonUsecase(sl<PokemonRepository>()),
  );


  sl.registerFactory<PokemonGameBloc>(
    () => PokemonGameBloc(
      sl<GetRandomPokemonUsecase>(),
      leaderboardBloc: sl<LeaderboardBloc>(),
      auth: sl<FirebaseAuth>(),
    ),
  );

 
  sl.registerLazySingleton<UserStatsRepository>(
    () => UserStatsRepositoryImpl(firestore: sl(), auth: sl()),
  );

 
  sl.registerLazySingleton<LeaderboardDataSource>(
    () => FirebaseLeaderboardDataSource(firestore: sl()),
  );


  sl.registerLazySingleton<LeaderboardRepository>(
    () => LeaderboardRepositoryImpl(sl<LeaderboardDataSource>()),
  );


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


  sl.registerFactory<LeaderboardBloc>(
    () => LeaderboardBloc(
      getTopScores: sl<GetTopScores>(),
      getTopStreaks: sl<GetTopStreaks>(),
      getTopDailyStreaks: sl<GetTopDailyStreaks>(),
      updateUserScore: sl<UpdateUserScore>(),
    ),
  );
}

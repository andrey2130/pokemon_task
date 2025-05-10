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

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<Dio>(Dio());
  // sl.registerSingleton<DioClient>(DioClient());

  // Firebase Services
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

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
}

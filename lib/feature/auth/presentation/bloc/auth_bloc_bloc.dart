import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';

import 'package:pokemon_task/feature/auth/domain/usecases/login_usecase.dart';
import 'package:pokemon_task/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:pokemon_task/feature/auth/domain/usecases/register_usecase.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc_bloc.freezed.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final LogoutUsecase _logoutUsecase;

  AuthBlocBloc(this._loginUsecase, this._registerUsecase, this._logoutUsecase)
    : super(const AuthBlocState.initial()) {
    on<InitializeAuthState>(_onInitializeAuthState);
    on<Register>(_onRegister);
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onInitializeAuthState(
    InitializeAuthState event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());

    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      emit(const AuthBlocState.authenticated());
    } else {
      emit(const AuthBlocState.unauthenticated());
    }
  }

  Future<void> _onRegister(Register event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _registerUsecase(event.params);

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (_) => emit(const AuthBlocState.authenticated()),
    );
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _loginUsecase(event.params);

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (_) => emit(const AuthBlocState.authenticated()),
    );
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    await _logoutUsecase(NoParams());
    emit(const AuthBlocState.unauthenticated());
  }
}

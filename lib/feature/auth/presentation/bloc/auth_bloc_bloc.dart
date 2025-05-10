import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';
import 'package:pokemon_task/feature/auth/domain/repository/auth_repo.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc_bloc.freezed.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository _authRepository;
  final FirebaseAuth _firebaseAuth;

  AuthBlocBloc(this._authRepository, this._firebaseAuth)
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

    final User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      emit(const AuthBlocState.authenticated());
    } else {
      emit(const AuthBlocState.unauthenticated());
    }
  }

  Future<void> _onRegister(Register event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _authRepository.registerWithEmailAndPassword(
      event.params,
    );

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (_) => emit(const AuthBlocState.authenticated()),
    );
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    final result = await _authRepository.loginWithEmailAndPassword(
      event.params,
    );

    result.fold(
      (failure) => emit(AuthBlocState.failure(message: failure.message)),
      (_) => emit(const AuthBlocState.authenticated()),
    );
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());

    await _authRepository.logout();
    emit(const AuthBlocState.unauthenticated());
  }
}

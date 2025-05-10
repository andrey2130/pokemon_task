part of 'auth_bloc_bloc.dart';

@freezed
class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.initializeAuthState() = InitializeAuthState;
  const factory AuthBlocEvent.register(RegisterParams params) = Register;
  const factory AuthBlocEvent.signIn(LoginParams params) = SignIn;
  const factory AuthBlocEvent.signOut() = SignOut;
}

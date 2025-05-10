import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_task/feature/auth/domain/params/login_params.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';

abstract interface class AuthDataSource {
  Future<void> signInWithEmailAndPassword(LoginParams signInParams);
  Future<UserCredential> createUserWithEmailAndPassword(
    RegisterParams registerParams,
  );
  Future<void> signOut();
  Future<bool> isLoggedIn();
  User? get currentUser;
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    RegisterParams registerParams,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: registerParams.email,
      password: registerParams.password,
    );

    await userCredential.user?.updateDisplayName(registerParams.name);

    return userCredential;
  }

  @override
  Future<void> signInWithEmailAndPassword(LoginParams loginParams) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginParams.email,
      password: loginParams.password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<bool> isLoggedIn() async {
    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}

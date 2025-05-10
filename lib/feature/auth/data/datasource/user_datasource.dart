import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_task/feature/auth/domain/params/register_params.dart';

abstract class UserDataSource {
  Future<void> saveUserData(User user, RegisterParams params);
  Future<Map<String, dynamic>?> getUserData(String userId);
}

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firestore;

  UserDataSourceImpl(this._firestore);

  @override
  Future<void> saveUserData(User user, RegisterParams params) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': params.email,
        'name': params.name,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {

      print('Error saving user data: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final docSnapshot =
          await _firestore.collection('users').doc(userId).get();
      return docSnapshot.data();
    } catch (e) {

      print('Error getting user data: $e');
      rethrow;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import '../user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<String>getCurrentUserId();

  Future<dynamic> signIn(String email, String password);
  Future<MyUser> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> setUserToProducer(String email, String emailPro, String URL);
  Future<dynamic> getUserTest(String email);
  Future<void> setUserData(String userId, userData);
}

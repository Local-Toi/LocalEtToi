import 'package:firebase_auth/firebase_auth.dart';
import '../user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);
  Future<MyUser> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<void> resetPassword(String email);

  Future<MyUser> getUser(String userId);
  Future<void> setUserData(String userId, userData);
}

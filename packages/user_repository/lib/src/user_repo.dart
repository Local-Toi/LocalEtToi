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

/*
import 'dart:async';

import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) {
      print(_user);
      return _user;
    } else {
      return Future.delayed(
        const Duration(milliseconds: 300),
        () => _user = User(id: const Uuid().v4()),
      );
    }
  }
}
*/
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(
    String email,
    String password,
  ) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      MyUser myUser = MyUser(
        id: user.user!.uid,
        identifiant: '',
        email: email,
        firstName: '',
        lastName: '',
      );

      myUser = myUser.copyWith(
        id: user.user!.uid,
        identifiant: '',
        email: email,
        firstName: '',
        lastName: '',
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getUser(String userId) async {
    try {
      return usersCollection.doc(userId).get().then(
            (value) => MyUser.fromEntity(
              MyUserEntity.fromDocument(value.data()!),
            ),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<void> setUserData(String userId, userData) {
    try {
      return usersCollection.doc(userId).set(userData);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

import 'dart:async';
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
  Future<dynamic> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toLowerCase(),
        password: password,
      );
      Completer c = new Completer();
      usersCollection.where('email', isEqualTo: email).get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          c.complete(doc);
        });
      });;
      return c.future;
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
        email: email.toLowerCase(),
        password: password,
      );

      MyUser myUser = MyUser(
        id: user.user!.uid,
        identifiant: '',
        email: email.toLowerCase(),
        firstName: '',
        lastName: '',
        isProducer: false,
        emailPro: '',
        urlVerification: '',
      );

      myUser = myUser.copyWith(
        id: user.user!.uid,
        identifiant: '',
        email: email.toLowerCase(),
        firstName: '',
        lastName: '',
        isProducer: false,
        emailPro: '',
        urlVerification: '',
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

  Future<dynamic> getUserTest(String email) async {
    try {
      Completer c = new Completer();
      usersCollection.where('email'.toLowerCase(), isEqualTo: email).get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          c.complete(doc);
        });
      });;
      return c.future;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> setUserToProducer(String email, String emailPro, String URL) async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.where('email'.toLowerCase(), isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.id;
        await usersCollection.doc(userId).update({
          'isProducer': true,
          'emailPro': emailPro,
          'urlVerification': URL,
        });
      } else {
        throw Exception('Utilisateur non trouvé avec l\'email spécifié');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }



  Future<String> getCurrentUserId() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user?.uid ?? '';
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

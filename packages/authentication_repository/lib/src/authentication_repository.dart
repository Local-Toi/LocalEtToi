import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    /*
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );*/

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      _controller.add(AuthenticationStatus.authenticated);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void logOut() async {
    try {
      await _firebaseAuth.signOut();
      _controller.add(AuthenticationStatus.unauthenticated);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void dispose() => _controller.close();
}

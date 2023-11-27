import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignUpEvent {}

class SignUpPressed extends SignUpEvent {
  final String identifiant;
  final String nom;
  final String prenom;
  final String email;
  final String password;

  SignUpPressed({
    required this.identifiant,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
  });
}

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String error;

  SignUpError({required this.error});
}

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpPressed) {
      yield SignUpLoading();
      try {
        var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        var userId = authResult.user!.uid;

        await _firestore.collection('users').doc(userId).set({
          'identifiant': event.identifiant,
          'nom': event.nom,
          'prenom': event.prenom,
          'email': event.email,
        });

        yield SignUpSuccess();
      } catch (e) {
        yield SignUpError(error: e.toString());
      }
    }
  }
}
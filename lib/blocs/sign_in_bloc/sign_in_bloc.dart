import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  bool? isProducer;

  bool? get currentStatus => isProducer;

  SignInBloc({
    required UserRepository myUserRepository,
  })  : _userRepository = myUserRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      try {
        final user = await _userRepository.signIn(event.email, event.password);
        isProducer = user['isProducer'];
        print('********');
        print(isProducer);
        print('********');
        emit(SignInSuccess());
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        emit(SignInFailure(message: e.message));
      } catch (e) {
        log(e.toString());
        emit(const SignInFailure());
      }
    });
    on<SignOutRequired>((event, emit) async {
      await _userRepository.signOut();
    });
  }
}

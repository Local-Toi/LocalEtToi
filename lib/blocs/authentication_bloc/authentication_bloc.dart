import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/// The [AuthenticationBloc] is responsible for managing the authentication state of the user.
/// It extends the [Bloc] class and handles [AuthenticationEvent]s to produce [AuthenticationState]s.
///
/// The [userRepository] is used to interact with the user data.
/// The [_userSubscription] is a stream subscription that listens to changes in the user data.
///
/// The [AuthenticationBloc] constructor takes a [UserRepository] as a required parameter.
///
/// The [close] method cancels the [_userSubscription] and closes the bloc.
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({
    required UserRepository myUserRepository,
  })  : userRepository = myUserRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = userRepository.user.listen((authUser) {
      add(AuthenticationStatusChanged(authUser));
    });

    on<AuthenticationStatusChanged>((event, emit) {
      try {
        if (event.user != null) {
          emit(AuthenticationState.authenticated(event.user!));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      } catch (e) {
        emit(const AuthenticationState.unauthenticated());
      }
    });

    @override
    Future<void> close() {
      _userSubscription.cancel();
      return super.close();
    }
  }
}

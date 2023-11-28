part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class signInRequired extends SignInEvent {
  final String email;
  final String password;

  const signInRequired({
    required this.email,
    required this.password,
  });
}

class signOutRequired extends SignInEvent {
  const signOutRequired();
}

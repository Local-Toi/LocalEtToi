part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final String identifiant;
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpRequired({
    required this.identifiant,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}

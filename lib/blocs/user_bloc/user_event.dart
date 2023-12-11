part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetMyUser extends UserEvent {
  final String myUserId;

  const GetMyUser({
    required this.myUserId,
  });

  @override
  List<Object> get props => [myUserId];
}

class ResetPasswordUser extends UserEvent {
  final String email;

  const ResetPasswordUser({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

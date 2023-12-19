part of 'authentication_bloc.dart';

/// Base class for authentication events.
/// All authentication events should extend this class.
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// Event triggered when the authentication status changes.
/// It contains the updated user information.
class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.user);

  final User? user;
}

/// Event triggered when a logout is requested.
class AuthenticationLogoutRequested extends AuthenticationEvent {}

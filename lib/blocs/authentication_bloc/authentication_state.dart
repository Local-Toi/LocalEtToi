part of 'authentication_bloc.dart';

/// Represents the different authentication statuses.
enum AuthenticationStatus {
  /// The authentication status is unknown.
  unknown,

  /// The user is authenticated.
  authenticated,

  /// The user is unauthenticated.
  unauthenticated
}

/// Represents the state of authentication.
class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  /// Constructs an [AuthenticationState] with the given status and user.
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  /// Constructs an [AuthenticationState] with the unknown status.
  const AuthenticationState.unknown() : this._();

  /// Constructs an [AuthenticationState] with the authenticated status and the given user.
  const AuthenticationState.authenticated(User user) : this._(status: AuthenticationStatus.authenticated, user: user);

  /// Constructs an [AuthenticationState] with the unauthenticated status.
  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}

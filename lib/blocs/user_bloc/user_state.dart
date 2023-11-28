part of 'user_bloc.dart';

enum UserStatus { success, loading, failure }

class UserState extends Equatable {
  final MyUser? user;
  final UserStatus status;

  const UserState._({
    this.user,
    this.status = UserStatus.loading,
  });

  const UserState.loading() : this._();

  const UserState.success(MyUser user) : this._(user: user, status: UserStatus.success);

  const UserState.failure() : this._(status: UserStatus.failure);

  @override
  List<Object?> get props => [user, status];
}

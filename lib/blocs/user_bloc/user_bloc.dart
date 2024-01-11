import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({
    required UserRepository myUserRepository,
  })  : _userRepository = myUserRepository,
        super(UserState.loading()) {
    on<GetMyUser>((event, emit) async {
      emit(const UserState.loading());
      try {
        final userId = await _userRepository.getCurrentUserId();
        final myUser = await _userRepository.getUserTest(userId);
        emit(UserState.success(myUser));
      } catch (e) {
        log(e.toString());
        emit(const UserState.failure());
      }
    });
  }
}

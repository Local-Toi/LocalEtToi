import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final UserRepository _userRepository;

  ForgetPasswordCubit({
    required UserRepository myUserRepository,
  })  : _userRepository = myUserRepository,
        super(ForgetPasswordInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      emit(ForgetPasswordLoading());
      await _userRepository.resetPassword(email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(error: 'Erreur dans l\'envoi du mail de réinitialisation'));
    }
  }
}

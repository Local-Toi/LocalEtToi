import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc({
    required UserRepository myUserRepository,
  })  : _userRepository = myUserRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      try {
        MyUser user = await _userRepository.signUp(
          event.email,
          event.password,
        );
        // data get from SignUpProcess
        await _userRepository.setUserData(user.id, {
          'identifiant': event.identifiant,
          'firstName': event.firstName,
          'lastName': event.lastName,
          'email': event.email,
          'isProducer': false,
        });
        emit(SignUpSuccess());
      } catch (e) {
        emit(const SignUpFailure());
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/screens/home/home_screen.dart';
import 'package:user_repository/user_repository.dart';

class ProfileLP extends StatelessWidget {
  const ProfileLP({super.key});

  @override
  Widget build(BuildContext context) {
    // return logout button
    return BlocProvider(
      create: (context) => SignInBloc(myUserRepository: context.read<AuthenticationBloc>().userRepository),
      child: ElevatedButton(
        onPressed: () {
          print("logout");
          context.read<SignInBloc>().add(const SignOutRequired());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        child: const Text('Logout'),
      ),
    );
  }
}

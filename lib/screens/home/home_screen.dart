import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/screens/authentication/sign_in.dart';
import 'package:local_et_toi/screens/authentication/sign_up_part1.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: constants.beige),
      child: Stack(
        children: [
          Positioned(
            top: 107,
            right: 0,
            left: 0,
            child: Center(
                child: Image.asset(
              "assets/images/logo1.png",
              width: 300,
              height: 300,
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 516,
            child: Center(
              child: SizedBox(
                child: GreenRoundedButton(
                  onPressed: () {
                    // BlocProvider.of<SignInBloc>(context).add(SignInEvent());
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<SignInBloc>(
                          create: (context) => SignInBloc(
                            myUserRepository: context.read<AuthenticationBloc>().userRepository,
                          ),
                          child: const SignInPage(),
                        ),
                      ),
                    );
                  },
                  buttonText: 'Se connecter',
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 592,
            child: Center(
              child: SizedBox(
                width: 350,
                child: Divider(
                  color: constants.darkGreen,
                  thickness: 1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 626,
            child: Center(
              child: SizedBox(
                child: GreenRoundedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage1(),
                      ),
                    );
                  },
                  buttonText: 'S\'inscrire',
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 701,
              child: Center(
                child: SizedBox(
                    child: TransparentRoundedButtonWithBorder(
                      onPressed: () {},
                      buttonText: 'Continuer en tant qu\'invité',
                    )),
              ))
        ],
      ),
    ));
  }
}

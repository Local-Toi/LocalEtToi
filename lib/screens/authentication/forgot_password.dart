import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import '../../utils/buttons/buttons.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late String email = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        myUserRepository: context.read<AuthenticationBloc>().userRepository,
      ),
      child: Scaffold(
        body: Container(
          //width: 390,
          //height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: constants.beige),
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
              const Positioned(
                top: 39,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Mot de passe oublié',
                    style: constants.titre,
                  ),
                ),
              ),
              const Positioned(
                top: 133,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Saisis ton adresse email pour obtenir un lien de récupération',
                    textAlign: TextAlign.center,
                    style: constants.text,
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 242,
                    child: Center(
                      child: SizedBox(
                        width: 390,
                        height: 300,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 17, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Adresse email',
                                    style: TextStyle(
                                      color: constants.beige,
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 355,
                              height: 45,
                              child: TextField(
                                controller: TextEditingController()..text = email,
                                onChanged: (text) {
                                  email = text;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0x2640B65D),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: constants.darkGreen),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: constants.darkGreen),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  labelText: 'Adresse email',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 720,
                  child: Center(
                      child: SizedBox(
                    width: 300,
                    height: 40,
                    child: GreenRoundedButton(
                      onPressed: () async {
                        print('email: $email');
                        await context.read<ForgetPasswordCubit>().sendPasswordResetEmail(email);

                        if (context.read<ForgetPasswordCubit>().state is ForgetPasswordSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Un email de réinitialisation a été envoyé'),
                            ),
                          );
                        } else if (context.read<ForgetPasswordCubit>().state is ForgetPasswordFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Une erreur est survenue'),
                            ),
                          );
                        }
                      },
                      buttonText: 'Envoyer le lien',
                    ),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}

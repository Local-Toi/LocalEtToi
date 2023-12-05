import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/components/strings.dart';
import 'package:local_et_toi/model/user.dart';
import 'package:local_et_toi/screens/navigation.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/signin/signin_response.dart';
import 'package:local_et_toi/utils/textfields/textdields.dart';
import 'package:local_et_toi/screens/loading.dart';
import '../forgot_password.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

import '../home/home_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> implements LoginCallBack {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String username, password;
  late bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  late LoginResponse loginResponse;

  SignInPageState() {
    loginResponse = LoginResponse(this);
  }

  /**
   * This function is used to navigate to the home screen
   */
  get onPressed => () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  };

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Navigation(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: constants.beige),
          child: Stack(
            children: [
              arrow_back.ArrowBack(onPressed: onPressed),
              const Positioned(
                left: 0,
                right: 0,
                top: 45,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Connexion',
                        style: constants.titre,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 655,
                child: Center(
                  child: SizedBox(
                    child: GreenRoundedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // get email and password form fields
                          formKey.currentState!.save();
                          context.read<SignInBloc>().add(SignInRequired(email: username, password: password));
                          if (context.read<SignInBloc>().state is SignInSuccess) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoadingView(),
                              ),
                            );
                          }
                        }
                      },
                      buttonText: 'Se connecter',
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 720,
                child: Center(
                  child: SizedBox(
                    child: TransparentRoundedButtonWithBorder(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                      buttonText: 'Mot de passe oublié',
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 133,
                    child: Center(
                      child: SizedBox(
                        width: 390,
                        height: 300,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 17, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Adresse email',
                                      style: constants.textDarkGrey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: GreenTextFieldWithGreenerBorder(
                                  onSaved: (val) => username = val!,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer une adresse email';
                                    } else if (!emailRegExp.hasMatch(value)) {
                                      return 'Veuillez entrer une adresse email valide';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.only(left: 17, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Mot de Passe',
                                      style: constants.textDarkGrey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 355,
                                height: 45,
                                child: TextFormField(
                                  onSaved: (val) => password = val!,
                                  obscureText: _obscured,
                                  focusNode: textFieldFocusNode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer un mot de passe';
                                    } else if (!passwordRegExp.hasMatch(value)) {
                                      return 'Veuillez entrer un mot de passe valide';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: constants.lightGreen,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: constants.darkGreen,),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 2, color: constants.darkGreen,),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                    border: InputBorder.none,
                                    //floatingLabelBehavior: FloatingLabelBehavior.never,
                                    isDense: true,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: GestureDetector(
                                        onTap: _toggleObscured,
                                        child: Icon(
                                          _obscured ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                          color: constants.darkGreen,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String onLoginError(String error) {
    log("Authentication error: $error");
    return error;
  }

  @override
  void onLoginSuccess(User? user) {
    log("Authentication success");
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoadingView(),
        ),
      );
    }
  }
}

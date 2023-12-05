import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/components/strings.dart';
import 'package:local_et_toi/screens/navigation.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/signin/signin_response.dart';
import 'package:local_et_toi/utils/textfields/textdields.dart';
import 'package:local_et_toi/screens/loading.dart';

import '../home/home_screen.dart';
import '../forgot_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String username, password;
  late bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  late LoginResponse loginResponse;

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
          //width: 390,
          //height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFFFBE2)),
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
                left: 0,
                right: 0,
                top: 39,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Connexion',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
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
                    width: 300,
                    height: 40,
                    child: GreenRoundedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // get email and password form fields
                          formKey.currentState!.save();
                          context.read<SignInBloc>().add(SignInRequired(email: username, password: password));
                          print(context);
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
                    width: 300,
                    height: 40,
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
                                      style: TextStyle(
                                        color: Colors.grey,
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
                                      style: TextStyle(
                                        color: Colors.grey,
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
                                child: TextFormField(
                                  onSaved: (val) => password = val!,
                                  //controller: passwordController,
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
                                    fillColor: const Color(0x2640B65D),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 1, color: Color(0xFF095D40)),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 2, color: Color(0xFF095D40)),
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
                                          color: const Color(0xFF095D40),
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
}

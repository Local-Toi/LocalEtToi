import 'package:flutter/material.dart';
import 'package:local_et_toi/screens/sign_up_part1.dart';
<<<<<<< HEAD

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
=======
>>>>>>> a2e943e9874958533f5f98f65c70f9295e8150c9

import '../utils/buttons/buttons.dart';
import '../utils/textfields/textdields.dart';
import 'home/home_screen.dart';

class SignUpPage2 extends StatefulWidget {
  const SignUpPage2(
      {super.key, required this.identifiant, required this.nom, required this.prenom, required this.email});
  final String identifiant;
  final String nom;
  final String prenom;
  final String email;

  @override
  _SignUpPageState2 createState() => _SignUpPageState2();
}

class _SignUpPageState2 extends State<SignUpPage2> {
  final formKey = GlobalKey<FormState>();
  late String password, confirmedPassword;
  late SignUpBloc signUpBloc;
  late bool _obscured1 = true;
  late bool _obscured2 = true;
  final textFieldFocusNode1 = FocusNode();
  final textFieldFocusNode2 = FocusNode();

  void _toggleObscured1() {
    setState(() {
      _obscured1 = !_obscured1;
      if (textFieldFocusNode1.hasPrimaryFocus) return;
      textFieldFocusNode1.canRequestFocus = false;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) return;
      textFieldFocusNode2.canRequestFocus = false;
    });
  }

  @override
  void initState() {
    super.initState();
    signUpBloc = SignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFFFFBE2)),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage1(),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 720,
              child: (Center(
                  child: SizedBox(
                      width: 300,
                      height: 40,
                      child: GreenRoundedButton(
                        onPressed: () {},
                        buttonText: 'S\'inscrire',
                      )))),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 720,
              child: (Center(
                  child: SizedBox(
                      width: 300,
                      height: 40,
                      child: GreenRoundedButton(
                        onPressed: () {},
                        buttonText: 'S\'inscrire',
                      )))),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 108,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Mot de passe',
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
                              onSaved: (val) => password = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un mot de passe';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Confirmer le mot de passe',
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
                              onSaved: (val) => confirmedPassword = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez confirmer votre mot de passe';
                                } else if (value != password) {
                                  return 'Les mots de passe ne sont pas identiques';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
<<<<<<< HEAD
=======
    );
>>>>>>> a2e943e9874958533f5f98f65c70f9295e8150c9
  }
}

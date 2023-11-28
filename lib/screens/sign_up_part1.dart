import 'package:flutter/material.dart';
import 'package:local_et_toi/screens/sign_up_part2.dart';

import '../utils/buttons/buttons.dart';
import '../utils/textfields/textdields.dart';
import 'home/home_screen.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({super.key});

  @override
  _SignUpPageState1 createState() => _SignUpPageState1();
}

class _SignUpPageState1 extends State<SignUpPage1> {
  final formKey = GlobalKey<FormState>();
  late String identifiant, nom, prenom, email;

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
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
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 39,
              child: Center(
                child: Text(
                  'Inscription',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
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
                        onPressed: () {
                          if (validateForm()) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignUpPage2(
                                  identifiant: identifiant,
                                  nom: nom,
                                  prenom: prenom,
                                  email: email,
                                ),
                              ),
                            );
                          }
                        },
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
                                  'Identifiant',
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
                              onSaved: (val) => identifiant = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un identifiant';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Nom',
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
                              onSaved: (val) => nom = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre nom';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Prenom',
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
                              onSaved: (val) => prenom = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre prénom';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
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
                              onSaved: (val) => email = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre email';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Veuillez entrer une adresse e-mail valide';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
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
    );
  }
}

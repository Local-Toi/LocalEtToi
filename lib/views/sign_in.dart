import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_et_toi/model/user.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/signin/signin_response.dart';
import 'package:local_et_toi/utils/textfields/textdields.dart';
import 'package:local_et_toi/views/loading.dart';

import 'landing_page_connexion.dart';
import 'forgot_password.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SignInPage(),
    ),
  ));
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> implements LoginCallBack {
  late BuildContext _context;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String username, password;
  late bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  late LoginResponse loginResponse;

  /*TextEditingController emailController =
  TextEditingController(text: 'user@example.com');
  TextEditingController passwordController =
  TextEditingController(text: 'password123');*/

  _SignInPageState() {
    loginResponse = LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        form.save();
        loginResponse.doLogin(username, password);
      });
    }
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainView(),
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
                      _submit();
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
              children: [Positioned(
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
                            padding: EdgeInsets.only(left : 17, bottom: 10),
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
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(left : 17, bottom: 10),
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
                                contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                                border: InputBorder.none,
                                //floatingLabelBehavior: FloatingLabelBehavior.never,
                                isDense: true,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured,
                                    child: Icon(
                                      _obscured
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded, color: const Color(0xFF095D40),
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
              ),],
            ),
          ],
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


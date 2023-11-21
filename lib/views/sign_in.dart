import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_et_toi/model/user.dart';
import 'package:local_et_toi/utils/signin/signin_response.dart';
import 'package:local_et_toi/views/loading.dart';

import 'first.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: LoginPage(),
    ),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
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

  _LoginPageState() {
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
        width: 390,
        height: 844,
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
              left: 140,
              top: 39,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Connexion',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 45,
              top: 655,
              child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                child: TextButton(
                  onPressed: () { _submit();},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF095D40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const SizedBox(
                    width: 300,
                    child: Text(
                      'Se connecter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 720,
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: const Color(0xFF095D40),
                  ),
                    borderRadius: BorderRadius.circular(30),
              ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const SizedBox(
                    width: 300,
                    child: Text(
                      'Mot de passe oublié',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF095D40),
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [Positioned(
                left: 0,
                top: 133,
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
                          child: TextFormField(
                            onSaved: (val) => username = val!,
                            //controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer une adresse email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
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
                              const EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                            ),
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


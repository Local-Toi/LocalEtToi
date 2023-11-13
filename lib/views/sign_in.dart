import 'package:flutter/material.dart';
import 'package:local_et_toi/model/user.dart';
import 'package:local_et_toi/utils/login_response.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: LoginPage(),
    ),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
  late BuildContext _context;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String username, password;

  late LoginResponse loginResponse;

  TextEditingController emailController =
  TextEditingController(text: 'user@example.com');
  TextEditingController passwordController =
  TextEditingController(text: 'password123');

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
                      fontSize: 24,
                      fontFamily: 'Eczar',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 45,
              top: 352,
              child: Container(
                  width: 300,
                  height: 40,
                  decoration: const BoxDecoration(
                    boxShadow: [
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
                      borderRadius: BorderRadius.circular(10),
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
                        fontFamily: 'Eczar',
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
              top: 422,
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: const Color(0xFF095D40),
                  ),
                    borderRadius: BorderRadius.circular(10),
              ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
                        fontFamily: 'Eczar',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 133,
              child: SizedBox(
                width: 390,
                height: 300, // Adjust the height as needed
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 355,
                        height: 45,
                        decoration: ShapeDecoration(
                          color: const Color(0x2640B65D),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF095D40),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Adresse email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 355,
                        height: 45,
                        decoration: ShapeDecoration(
                          color: const Color(0x2640B65D),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF095D40),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Mot de passe',
                            hintStyle: TextStyle(color: Colors.grey),
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
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(User? user) {
    // TODO: implement onLoginSuccess
  }
}

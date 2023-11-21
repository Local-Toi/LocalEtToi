import 'package:flutter/material.dart';
import 'package:local_et_toi/views/sign_in.dart';

import '../utils/textfields/textdields.dart';
import 'first.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFFFFBE2)),
        child: Stack (
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
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
            const Positioned(
              top: 133,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Saisis ton adresse email pour obtenir un lien de récupération',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Stack(
              children: [Positioned(
                left: 0,
                top: 242,
                child: SizedBox(
                  width: 390,
                  height: 300,
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
                          onSaved: (val) => email = val!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer une adresse email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
              ),],
            ),
          ],
        ),
      ),
    );
  }
}

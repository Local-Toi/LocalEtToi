import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/button/buttons.dart';
import 'package:local_et_toi/views/sign_in.dart';
import 'package:local_et_toi/views/sign_up.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

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
              left: 44,
              top: 107,
              width: 300,
              height: 300,
              child: Image.asset("assets/images/logo1.png"),

            ),
            Positioned(
              left: 0,
              right: 0,
              top: 516,
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: GreenRoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
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
                  width: 274,
                  child: Divider(
                    color: Color(0xFF095D40),
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
                  width: 300,
                  height: 40,
                  child:
                  GreenRoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
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
                  width: 300,
                  height: 40,
                  child: TransparentRoundedButtonWithBorder(
                    onPressed: () {

                    }, buttonText: 'Continuer en tant qu\'invité',
                  )
                ),
              )
            )
          ],
        ),

      )
    );
  }
}
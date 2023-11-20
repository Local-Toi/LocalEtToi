import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_et_toi/views/sign_in.dart';

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
              left: 46,
              top: 516,
              child: SizedBox(
                width: 300,
                height: 40,
                child: Material(
                  color: Colors.transparent,
                  elevation: 100, // Ajustez cela pour le niveau d'ombre
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF095D40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
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
              ),

            )
          ]
        ),

      )
    );
  }
}
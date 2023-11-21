import 'dart:developer';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              top: 107, child:
              Image.asset("assets/images/logo1.png"),
            )
          ]
        )
      )
    );

  }



}
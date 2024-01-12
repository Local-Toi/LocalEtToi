import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: CGUView(),
    ),
  ));
}

class CGUView extends StatelessWidget {
  const CGUView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack (
            children: [
              arrow_back.ArrowBack(),
            ],
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: AboutView(),
    ),
  ));
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(children: const [
          Text("A propos" , style: constants.text),
        ]),
      ),
    );
  }
}
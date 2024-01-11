import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

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
        body:               Container(
          alignment : const FractionalOffset(0.01, 0.03),
          child: arrow_back.ArrowBack(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
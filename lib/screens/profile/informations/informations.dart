import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: InformationPage(),
    ),
  ));
}

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : constants.beige),
        )
    );
  }

}
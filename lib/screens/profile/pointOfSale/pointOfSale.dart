import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: pointOfSalePage(),
    ),
  ));
}

class pointOfSalePage extends StatefulWidget {
  const pointOfSalePage({super.key});

  @override
  _pointOfSalePageState createState() => _pointOfSalePageState();
}

class _pointOfSalePageState extends State<pointOfSalePage> {
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
import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/views/profile/Security.dart';

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SettingsPage(),
    ),
  ));
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : constants.beige),
          child: Stack(
            children: [
              Positioned(
                  top: 82,
                  child: Image.asset("assets/images/logo1.png")
              ),
              Positioned(
                child: GreenRoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SecurityView(),
                        ),
                      );
                    },
                    buttonText: 'Sécurité'
                    )
              )
            ],
          ),
          
        )
    );
  }

}
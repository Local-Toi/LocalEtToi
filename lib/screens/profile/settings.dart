import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/screens/profile/Security.dart';
import 'package:local_et_toi/screens/profile/about.dart';
import 'package:local_et_toi/screens/profile/assistance.dart';
import 'package:local_et_toi/screens/profile/cgu.dart';

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
              Container(
                alignment : const FractionalOffset(0.90, 0.03),
                child: IconButton(
                  icon: const Icon(Icons.help, size : 50),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const AssistancePage(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.09),
                      child: Image.asset("assets/images/logo1.png", scale: 1)
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.45),
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
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.55),
                  child: GreenRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const CGUView(),
                          ),
                        );
                      },
                      buttonText: 'CGU'
                  )
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.65),
                  child: GreenRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const AboutView(),
                          ),
                        );
                      },
                      buttonText: 'A propos'
                  )
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.75),
                  child: GreenRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SecurityView(),
                          ),
                        );
                      },
                      buttonText: 'Tu es producteur ?'
                  )
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.75),
                  child: RedRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SecurityView(),
                          ),
                        );
                      },
                      buttonText: 'Supprimer le compte'
                  )
              )
            ],
          ),
          
        )
    );
  }

}
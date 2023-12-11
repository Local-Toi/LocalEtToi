import 'package:flutter/material.dart';
import 'package:local_et_toi/screens/profile/settings/Security.dart';
import 'package:local_et_toi/screens/profile/settings/assistance.dart';
import 'package:local_et_toi/screens/profile/settings/cgu.dart';
import 'package:local_et_toi/utils/constants.dart';

import '../../utils/buttons/CheckBox.dart';
import '../../utils/buttons/buttons.dart';

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: ProfilPage(),
    ),
  ));
}

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : beige),
          child: Stack(
            children: [
              Container(
                alignment : const FractionalOffset(0.90, 0.03),
                child: IconButton(
                  icon: const Icon(Icons.settings, size : 50),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SecurityView(),
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
                      buttonText: 'Mes informations'
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
                      buttonText: 'Mes notes et avis'
                  )
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.65),
                  child: GreenRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SecurityView(),
                          ),
                        );
                      },
                      buttonText: 'Mes points de vente'
                  )
              ),
              Container(
                  alignment : const FractionalOffset(0.2, 0.86),
                  child: const CheckboxGreen(),
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.85),
                  child: const Text("Recevoir les newsletters"),
              ),
            ],
          ),

        )
    );
  }

}


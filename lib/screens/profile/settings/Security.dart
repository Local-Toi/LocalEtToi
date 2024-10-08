import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/buttons/buttons.dart';

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SecurityView(),
    ),
  ));
}

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  _SecurityViewState createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
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
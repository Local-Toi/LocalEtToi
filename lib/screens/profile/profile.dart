import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/screens/home/home_screen.dart';
import 'package:local_et_toi/screens/profile/comments/comments.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/pointOfSale.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/screens/profile/settings/settings.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../utils/buttons/CheckBox.dart';
import '../../utils/buttons/buttons.dart';
import 'informations/informations.dart';

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
    return BlocProvider(
        create: (context) => SignInBloc(myUserRepository: context.read<AuthenticationBloc>().userRepository),
        child: Scaffold(
            body: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color : constants.beige),
              child: Stack(
                children: [
                  Container(
                    alignment : const FractionalOffset(0.90, 0.03),
                    child: IconButton(
                      icon: const Icon(Icons.settings, size : 50),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
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
                                builder: (context) => const InformationPage(),
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
                                builder: (context) => const CommentsPage(),
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
                                builder: (context) => const pointOfSalePage(),
                              ),
                            );
                          },
                          buttonText: 'Mes points de vente'
                      )
                  ),
                  Container(
                      alignment : const FractionalOffset(0.14, 0.81),
                      child: const CheckboxGreen(),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.57, 0.805),
                      child: const Text("Recevoir les newsletters", style: constants.textDarkGreen,),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.90),
                      child: TransparentRoundedButtonWithBorder(
                          onPressed: () {
                            print("logout");
                            context.read<SignInBloc>().add(const SignOutRequired());
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          buttonText: 'Déconnexion'
                      )
                  ),
                ],
              ),

            )
        )
    );
  }
}


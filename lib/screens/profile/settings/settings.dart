import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/addProduct.dart';
import 'package:local_et_toi/screens/profile/producer/become_producer.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'Security.dart';
import 'about.dart';
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'cgu.dart';

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SettingsPage(),
    ),
  ));
}

Future<bool> getProducerStatus(AuthenticationBloc bloc) async {
  print('---------');
  print(bloc);
  print(bloc.state);
  print(bloc.state.user);
  print(bloc.state.user?.email);
  String? currentUser = bloc.state.user?.email;
  print(currentUser);
  print('Entering repo');
  final user = await bloc.userRepository.getUserTest(currentUser!);
  bool isProducer = user['isProducer'];
  print('out of repo');
  print(user['isProducer']);
  print('---------');
  return isProducer;
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    Future<bool> status = getProducerStatus(Bloc);
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : constants.beige),
          child: Stack(
            children: [
              Container(
                alignment : const FractionalOffset(0.01, 0.03),
                child: arrow_back.ArrowBack(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.09),
                      child: Image.asset("assets/images/logo1.png", scale: 1)
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.95),
                child: GreenRoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AddProduct(),
                        ),
                      );
                    },
                    buttonText: 'addproduct'
                    )
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.45),
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
                  alignment : const FractionalOffset(0.5, 0.55),
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
                alignment: const FractionalOffset(0.5, 0.65),
                child: FutureBuilder<bool>(
                  future: status,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(color: constants.darkGreen);
                    } else if (snapshot.hasError) {
                      return Text('Erreur: ${snapshot.error}');
                    } else if (snapshot.data == false) {
                      return GreenRoundedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (
                                    context) => const becomeProducer(),
                              ),
                            );
                          },
                          buttonText: 'Tu es producteur ?'
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),

        )
    );
  }

}
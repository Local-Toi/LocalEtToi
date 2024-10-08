import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/screens/futurUpdate.dart';
import 'package:local_et_toi/screens/profile/producer/become_producer.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

Future<bool> getProducerStatus(AuthenticationBloc bloc) async {
  String? currentUser = bloc.state.user?.email;
  final user = await bloc.userRepository.getUserTest(currentUser!);
  bool isProducer = user['isProducer'];
  return isProducer;
}

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool prod = false;
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
              const arrow_back.ArrowBack(),
              Container(
                  alignment : const FractionalOffset(0.5, 0.09),
                  child: Image.asset("assets/images/logo1.png", scale: 1)
              ),
              Container(
                  alignment : const FractionalOffset(0.5, 0.45),
                  child: GreenRoundedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FuturUpdate(),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FuturUpdate(),
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
                            Navigator.of(context).push(
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
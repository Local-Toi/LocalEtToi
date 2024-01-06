import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import '../../blocs/authentication_bloc/authentication_bloc.dart';
import '../../utils/buttons/buttons.dart';

class FuturUpdate extends StatefulWidget {
  const FuturUpdate({super.key});

  @override
  _FuturUpdateState createState() => _FuturUpdateState();
}

class _FuturUpdateState extends State<FuturUpdate> {
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
                      alignment : const FractionalOffset(0.5, 0.09),
                      child: Image.asset("assets/images/logo1.png", scale: 1)
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.45),
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 70,
                        right: 70,
                        bottom: 70,
                      ),
                      child: const Text(
                        "Cette page n'est pas encore disponible, elle arrivera surement dans la prochaine mise à jour, nous sommes ravis dde voir qu'elle vous intéresse.",
                        style: constants.textDarkGrey,
                      )
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.90),
                      child: TransparentRoundedButtonWithBorder(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          buttonText: 'Retourner en arrière'
                      )
                  ),
                ],
              ),
            )
        )
    );
  }
}

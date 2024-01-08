import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/components/strings.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/create_sellPoint.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:local_et_toi/screens/profile/profile.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/textfields/textfields.dart';


void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: becomeProducer(),
    ),
  ));
}

class becomeProducer extends StatefulWidget {
  const becomeProducer({super.key});


  @override
  _becomeProducerState createState() => _becomeProducerState();
}

class _becomeProducerState extends State<becomeProducer> {
  late String username, url;
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
                    alignment : const FractionalOffset(0.05, 0.05),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                    ),
                  ),
                  Container(
                    alignment : const FractionalOffset(0.5, 0.05),
                    child: const Text(
                      'Passer en compte producteur',
                      style: constants.titre,
                    ),
                  ),
                  Container(
                    alignment : const FractionalOffset(0.5, 0.05),
                    child: const Text(
                      "Renseigne l\'adresse email professionnelle qui sera présente sur ton point de vente dans l'application.",
                      style: constants.textDarkGrey,
                    ),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.90),
                      child: GreenTextFieldWithGreenerBorder(
                        onSaved: (val) => username = val!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une adresse email';
                          } else if (!emailRegExp.hasMatch(value)) {
                            return 'Veuillez entrer une adresse email valide';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      )
                  ),
                  Container(
                    alignment : const FractionalOffset(0.5, 0.05),
                    child: const Text(
                      'Inscris le lien vers une page web ou un compte de réseau social mentionnant ton entreprise. Cela permettra de vérifier la légitimité de tes points de ventes.',
                      style: constants.textDarkGrey,
                    ),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.90),
                      child: GreenTextFieldWithGreenerBorder(
                        onSaved: (val) => url = val!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une adresse email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                      )
                  ),
                  Container(
                    alignment : const FractionalOffset(0.5, 0.05),
                    child: const Text(
                      'Enfin, ajoute ton premier point de vente en cliquant sur le bouton ci-dessous.',
                      style: constants.textDarkGrey,
                    ),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.65),
                      child: GreenRoundedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const create_sellpoint(),
                              ),
                            );
                          },
                          buttonText: 'Ajouter un point de vente'
                      )
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.80),
                      child: GreenRoundedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const ProfilPage(),
                              ),
                            );
                          },
                          buttonText: 'Enregistrer'
                      )
                  ),
                ],
              ),

            )
        )
    );
  }
}

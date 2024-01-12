import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/components/strings.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/textfields/textfields.dart';

updateStatus(AuthenticationBloc bloc, String emailPro, String URL) async {
  print(bloc.state.user?.email);
  String? currentUser = bloc.state.user?.email;
  print(currentUser);
  await bloc.userRepository.setUserToProducer(currentUser!, emailPro, URL);
}

class becomeProducer extends StatefulWidget {
  const becomeProducer({super.key});
  @override
  _becomeProducerState createState() => _becomeProducerState();
}

class _becomeProducerState extends State<becomeProducer> {
  final _formKey = GlobalKey<FormState>();
  late String emailpro = '' , url = '';
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
            body: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color : constants.beige),
              child: Form(
                  key: _formKey,
                  child: Stack(
                      children: [
                      const arrow_back.ArrowBack(),
                      Container(
                        alignment : const FractionalOffset(0.5, 0.05),
                        child: const Text(
                          'Passer en compte producteur',
                          style: constants.titre,
                        ),
                      ),
                  Container(
                    alignment : const FractionalOffset(0.5, 0.3),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Renseigne l\'adresse email professionnelle qui sera présente sur ton point de vente dans l'application.",
                      style: constants.textDarkGrey,
                    ),
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.37),
                      margin: const EdgeInsets.all(8.0),
                      child: GreenTextFieldWithGreenerBorder(
                        onSaved: (val) => emailpro = val!,
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
                          alignment : const FractionalOffset(0.5, 0.50),
                          margin: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Inscris le lien vers une page web ou un compte de réseau social mentionnant ton entreprise. Cela permettra de vérifier la légitimité de tes points de ventes.',
                            style: constants.textDarkGrey,
                          ),
                  ),
                        Container(
                            alignment : const FractionalOffset(0.5, 0.60),
                            margin: const EdgeInsets.all(8.0),
                            child: GreenTextFieldWithGreenerBorder(
                              onSaved: (val) => url = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer une url';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.url,
                            )
                  ),
                  Container(
                      alignment : const FractionalOffset(0.5, 0.90),
                      margin: const EdgeInsets.all(8.0),
                      child: GreenRoundedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            updateStatus(Bloc, emailpro, url);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Vous êtes devenu producteur, quittez et revenez dans "profil" pour pouvoir consulter vos points de vente'),
                                duration: Duration(seconds: 4),
                              ),
                            );
                          }
                        },
                        buttonText: 'Enregistrer',
                      )
                  ),
                      ]
                  )
                  ),
              ),
            );
  }
}


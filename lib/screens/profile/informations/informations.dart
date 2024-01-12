import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: InformationPage(),
    ),
  ));
}

Future<List<String>> getProducerData(AuthenticationBloc bloc) async {
  print('2');
  String? currentUser = bloc.state.user?.email;
  print(currentUser);
  final user = await bloc.userRepository.getUserTest(currentUser!);
  print(user);
  print('3');
  String firstname = user['firstName'];
  String lastname = user['lastName'];
  String identifiant = user['identifiant'];
  String email = user['email'];

  List<String> data = [firstname, lastname, identifiant, email];
  return data;
}

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    final Future<List<String>> data = getProducerData(Bloc);
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : constants.beige),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const arrow_back.ArrowBack(),
                  Positioned(
                    top: 82,
                    child: Image.asset("assets/images/logo1.png")
                  ),
                Positioned(
                  top: 300,
                  left: 16,
                  right: 16,
                  child: FutureBuilder<List<String>>(
                    future: getProducerData(Bloc),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Afficher un indicateur de chargement pendant que les données sont en cours de récupération.
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Gérer les erreurs
                        return Text('Erreur: ${snapshot.error}');
                      } else {
                        // Afficher les données dans la carte
                        List<String> data = snapshot.data!;
                        return Card(
                          elevation: 5,
                          color: constants.beige,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Prénom: ${data[0]}'),
                                Text('Nom: ${data[1]}'),
                                Text('Identifiant: ${data[2]}'),
                                Text('Email: ${data[3]}'),
                              ],
                            ),
                          ),
                        );
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
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/sellPoint.dart';
import 'package:local_et_toi/utils/buttons/drop_down_menu.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:local_et_toi/utils/textfields/textfields.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:image_picker/image_picker.dart';

import '../../../utils/buttons/buttons.dart';

class SellPoint extends StatefulWidget {
  const SellPoint({super.key});

  @override
  _SellPointState createState() => _SellPointState();
}

registerNewShop(String name, String address, String? description, List<dynamic>? horaires, String? phonenumber, String id) async {
  final FirebaseShopRepository shopRepository = FirebaseShopRepository();
  final double latitudeResult;
  final double longitudeResult;
  final String adressResult;
  List<Location> locations = await locationFromAddress(address);
  if (locations.isNotEmpty) {
    latitudeResult = locations[0].latitude;
    longitudeResult = locations[0].longitude;
    adressResult = address;

    print('Latitude: $latitudeResult, Longitude: $longitudeResult');
  } else {
    adressResult = 'Adresse introuvable';
    latitudeResult = 0;
    longitudeResult = 0;
    print('Adresse introuvable');
  }
  final MyShop shop = MyShop(
    name: name,
    adresse: adressResult,
    description: description,
    horaires: horaires,
    phonenumber: phonenumber,
    latitude: latitudeResult,
    longitude:longitudeResult,
    id: id,
  );
  await shopRepository.addShop(shop);
}

class _SellPointState extends State<SellPoint> {
  late String name, adresse, desc, tel, id, horaires;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: constants.beige),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment : const FractionalOffset(0.01, 0.03),
                child: arrow_back.ArrowBack(
                  onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const pointOfSalePage(),
                        ),
                      );
                    },
                ),
              ),

              // Titre
              const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Text(
                  "Ajout d'un point de vente",
                  style: constants.titre,
                ),
              ),

              // Formulaire
              Builder(builder: (context) =>
                  Form(
                  key: formKey,
                    child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        alignment: const FractionalOffset(0.5, 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nom',
                              style: constants.text,
                            ),
                            GreenTextFieldWithGreenerBorder(
                              onSaved: (val) => name = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un nom pour le point de vente';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        alignment: const FractionalOffset(0.5, 0.6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Adresse',
                              style: constants.text,
                            ),
                            GreenTextFieldWithGreenerBorder(
                              onSaved: (val) => adresse = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer une adresse pour le point de vente';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          alignment: const FractionalOffset(0.5, 0.7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Description',
                                style: constants.text,
                              ),
                              GreenTextFieldWithGreenerBorder(
                                onSaved: (val) => desc = val!,
                                validator: (value) {
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          alignment: const FractionalOffset(0.5, 0.7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Numéro de téléphone(facultatif)',
                                style: constants.text,
                              ),
                              GreenTextFieldWithGreenerBorder(
                                onSaved: (val) => tel = val!,
                                validator: (value) {
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          alignment: const FractionalOffset(0.5, 0.7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Les horaires de votre point de vente (facultatif, format : Lundi 8h-18h, Mardi 7h-11h, etc.)',
                                style: constants.text,
                              ),
                              GreenTextFieldWithGreenerBorder(
                                onSaved: (val) => horaires = val!,
                                validator: (value) {
/*                                    if (!emailRegExp.hasMatch(value)) {
                                    return 'Veuillez entrer vos horaires au format indiqué';
                                    }*/
                                    return null;
                                    },
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )
                      ),
                      // Bouton Enregistrer
                      GreenRoundedButton(
                        onPressed: () {
                          if (Form.of(context).validate()) {
                            Form.of(context).save();
                            registerNewShop(name, adresse, desc, horaires.split(', '), tel, Bloc.state.user!.uid);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const pointOfSalePage(),
                              ),
                            );
                          }
                        },
                        buttonText: 'Enregistrer',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SellPoint(),
    ),
  ));
}
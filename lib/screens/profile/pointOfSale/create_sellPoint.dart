import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/buttons/drop_down_menu.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:local_et_toi/utils/textfields/textfields.dart';
//import 'package:image_picker/image_picker.dart';

import '../../../utils/buttons/buttons.dart';

class SellPoint extends StatefulWidget {
  const SellPoint({super.key});

  @override
  _SellPointState createState() => _SellPointState();
}

class _SellPointState extends State<SellPoint> {
  File? _image;
  late String name, adresse, desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: constants.beige),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment : const FractionalOffset(0.01, 0.03),
                child: arrow_back.ArrowBack(
                  onPressed: () {
                    Navigator.of(context).pop();
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

              // Image picker
              GestureDetector(
                //onTap: _getImage,
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: constants.taupe,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : const Icon(
                          Icons.add_a_photo, size: 50.0, color: Colors.white),
                      const SizedBox(height: 8.0),
                      const Text("Ajouter une photo pour votre point de vente",
                          selectionColor: Color(0x00ffffff)),
                    ],
                  ),
                ),
              ),

              // Formulaire
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: GlobalKey<FormState>(),
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
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Catégorie',
                                style: constants.text,
                              ),
                              DropdownMenuWidget(
                                itemList: constants.categoriesList,
                              )
                            ],
                          )
                      ),
                      // Bouton Enregistrer
                      GreenRoundedButton(
                        onPressed: () {
                          // si tous les champs sont remplis on enregistre
                          if (Form.of(context)!.validate()) {
                            // Enregistrer le produit
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
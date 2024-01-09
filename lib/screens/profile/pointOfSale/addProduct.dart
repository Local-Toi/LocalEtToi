import 'dart:io';
import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../utils/buttons/buttons.dart';
import '../../../utils/textfields/textfields.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;
  late String name, price, quantity, unit, category;
  late String? description;
  String? _imageUrl;

  // variables pour stocker les valeurs des champs du formulaire
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  late TextEditingController descriptionController;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      // Enregistrez l'image dans Firebase Storage
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('product_image.jpg');

      await storageRef.putFile(imageFile);

      // Récupérez l'URL de l'image enregistrée
      final String imageUrl = await storageRef.getDownloadURL();

      setState(() {
        _imageUrl = imageUrl;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    unit = 'g';
    category = 'Fruit';

    nameController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
    descriptionController = TextEditingController();
  }

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
                margin: const EdgeInsets.only(top: 0.0),
                alignment: const FractionalOffset(0.01, 0.03),
                // arrow back
                child: arrow_back.ArrowBack(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              // Titre
              Container(
                margin: const EdgeInsets.only(top: 0.0),
                alignment: const FractionalOffset(0.5, 0.5),
                child: const Text(
                  "Ajout d'un produit",
                  style: constants.titre,
                ),
              ),

              // Image picker
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: constants.taupe,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: _image != null ? ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.file(_image!, fit: BoxFit.cover),
                  )
                  : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Ajouter une photo du produit",
                        style: TextStyle(color: Colors.white),
                      ),
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

                      // Nom produit
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
                              controller: nameController,
                              onSaved: (val) => name = val!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un nom de produit';
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
                        child: Row(
                          children: [

                            // Prix
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Prix',
                                      style: constants.text,
                                    ),
                                    GreenTextFieldWithGreenerBorder(
                                      controller: priceController,
                                      onSaved: (val) => price = val!,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez entrer le prix du produit';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Quantité
                            Container(
                              width: 200.0,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Quantité',
                                    style: constants.text,
                                  ),
                                  GreenTextFieldWithGreenerBorder(
                                    controller: quantityController,
                                    onSaved: (val) => quantity = val!,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez entrer une quantité';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                            ),

                            // Unité avec menu déroulant
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Unité',
                                      style: constants.text,
                                    ),
                                    DropdownButton<String>(
                                      value: unit,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          unit = newValue!;
                                        });
                                      },
                                      items: ['Pièce', 'Kg', 'g', 'L', 'cl', 'ml'].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Description
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        alignment: const FractionalOffset(0.5, 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description (facultatif)',
                              style: constants.text,
                            ),
                            TextField(
                              controller: descriptionController,
                              maxLines: null,
                              onChanged: (val) => description = val,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: constants.lightGreen,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Catégorie
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        alignment: const FractionalOffset(0.5, 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Catégorie',
                              style: constants.text,
                            ),
                            DropdownButton<String>(
                              value: category,
                              onChanged: (String? newValue) {
                                setState(() {
                                  category = newValue!;
                                });
                              },
                              items: [
                                'Fruit',
                                'Légume',
                                'Viande',
                                'Œuf',
                                'Produit laitier',
                                'Boisson',
                                'Boisson alcoolisée',
                                'Autre',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
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
      body: AddProduct(),
    ),
  ));
}

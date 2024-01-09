import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:image_picker/image_picker.dart';

import '../../../utils/buttons/buttons.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
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
              // arrow back
              arrow_back.ArrowBack(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              // Titre
              const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Text(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : const Icon(Icons.add_a_photo, size: 50.0, color: Colors.white),
                      const SizedBox(height: 8.0),
                      const Text("Ajouter une photo du produit", selectionColor: Color(0x00ffffff)),
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
                      _buildFormField('Nom', TextInputType.text),
                      _buildFormField('Prix', TextInputType.number),
                      _buildFormField('Unité', TextInputType.text),
                      _buildFormField('Description (facultatif)', TextInputType.text),

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

  Widget _buildFormField(String labelText, TextInputType keyboardType) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: constants.text,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            keyboardType: keyboardType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez remplir ce champ';
              }
              return null;
            },
          ),
        ],
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

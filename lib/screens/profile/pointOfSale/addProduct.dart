import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;
import 'package:firebase_core/firebase_core.dart';
import 'package:product_repository/product_repository.dart';
import '../../../utils/buttons/buttons.dart';
import '../../../utils/textfields/textfields.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;
  late String name, unit;
  late List<dynamic> category = [];
  late String selectedCategory;
  late String price;
  late String quantity;
  late String? description, _imageUrl, composition;
  late List<dynamic> labels = [];


  FirebaseProductRepository productRepository = FirebaseProductRepository();

  final formKey = GlobalKey<FormState>();

  testAddProduct(AuthenticationBloc bloc, String name, String price, String quantity, String unit, List<dynamic> category, String? description, List<dynamic> labels, String composition) async {
    MyProduct newProduct = MyProduct(
      name: name,
      price: price,
      quantity: quantity,
      unit: unit,
      description: description,
      categories: category,
      labels: labels,
      composition: composition,
      image: "",
      producerId: bloc.state.user!.uid,
    );
    await productRepository.addProduct(newProduct);
  }

  // Implémentation pour récupérer une image
  /*Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      // Enregistrez l'image dans Firebase Storage
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images_products')
          .child('product_image.jpg');

      await storageRef.putFile(imageFile);

      // Récupérez l'URL de l'image
      final String imageUrl = await storageRef.getDownloadURL();

      setState(() {
        _imageUrl = imageUrl;
        _image = imageFile;
      });

      // Affichez chargement
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image téléchargée avec succès'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }*/

  @override
  void initState() {
    super.initState();
    unit = 'g';
    category = [];
    name = '';
    price = "";
    quantity = "";
    description = '';
    composition = '';
    _imageUrl = '';
    selectedCategory = 'Fruit'; // Initialize with a default category

  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
        body: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color : constants.beige),
            child: Stack(
                children: [
                  const arrow_back.ArrowBack(),
                  const Padding(
                    padding: EdgeInsets.only(top: 45.0, left: 100.0, right: 20.0),
                    child: Text(
                      "Ajout d'un produit",
                      style: constants.titre,
                    ),
                  ),

                          // Image picker
                          /*GestureDetector(
                            //onTap: _getImage,
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              width: 250.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: constants.taupe,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: _image != null
                                  ? ClipRRect(
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
                          ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 160.0, left: 20.0, right: 20.0),
                      child:
                          // Formulaire
                          Builder(builder: (context) =>
                              Form(
                                key: formKey,
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
                                            onSaved: (val) => name = val!,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Veuillez entrer un nom de produit *';
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
                                                    onSaved: (val) => price = val!,
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Veuillez entrer le prix du produit *';
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
                                                  onSaved: (val) => quantity = val!,
                                                  validator: (value) {
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

                                    // Composition
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20.0),
                                      alignment: const FractionalOffset(0.5, 0.5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Composition',
                                            style: constants.text,
                                          ),
                                          GreenTextFieldWithGreenerBorder(
                                            onSaved: (val) => composition = val!,
                                            validator: (value) {
                                              return null;
                                            },
                                            keyboardType: TextInputType.text,
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
                                            'Description',
                                            style: constants.text,
                                          ),
                                          TextField(
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
                                            value: selectedCategory,  // Utilisez selectedCategory ici
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedCategory = newValue!;
                                                category = [newValue];
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


                                    // Labels avec menu déroulant à choix multiples
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20.0),
                                      alignment: const FractionalOffset(0.5, 0.5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Labels (choix multiples)',
                                            style: constants.text,
                                          ),
                                          DropdownButton<String>(
                                            value: null,
                                            onChanged: (String? newValue) {
                                            },
                                            items: [
                                              'Aucun label',
                                              'Bio',
                                              'Label rouge',
                                              'Élevé en plein air',
                                            ].map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      value: labels.contains(value),
                                                      onChanged: (bool? checked) {
                                                        setState(() {
                                                          if (checked != null) {
                                                            if (checked) {
                                                              labels.add(value);
                                                            } else {
                                                              labels.remove(value);
                                                            }
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    Text(value),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Bouton Enregistrer
                                    GreenRoundedButton(
                                      onPressed: () {
                                        // Vérifier que les champs obligatoires sont remplis
                                        // Si tous les champs sont remplis, on enregistre
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          testAddProduct(Bloc, name, price, quantity, unit, category, description, labels, composition!);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Produit enregistré avec succès'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      buttonText: 'Enregistrer',
                                    ),
                                  ],
                                ),
                              ),
                          ),
                          )
                        ],
                      ),
                    ),
                  );
  }
}
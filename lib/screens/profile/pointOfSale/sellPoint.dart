import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/addProduct.dart';
import 'package:local_et_toi/screens/profile/pointOfSale/create_sellPoint.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/constants.dart';
import 'package:product_repository/product_repository.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:local_et_toi/utils/components/arrow_back.dart' as arrow_back;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: pointOfSalePage(),
    ),
  ));
}

class pointOfSalePage extends StatefulWidget {
  const pointOfSalePage({super.key});

  @override
  _pointOfSalePageState createState() => _pointOfSalePageState();
}

class _pointOfSalePageState extends State<pointOfSalePage> {
  List<MyShop> shopResults = [];

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc Bloc = BlocProvider.of<AuthenticationBloc>(context);
    searchFirebase(Bloc.state.user!.uid);
    return Scaffold(
        body: Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: constants.beige),
          child: Stack(
              children: [
                  const arrow_back.ArrowBack(),
                Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shopResults.length,
                itemBuilder: (context, index) {
                    final shop = shopResults[index];
                    return SearchProducerCard(
                      title: shop.name ?? 'N/A',
                      address: shop.adresse ?? 'N/A',
                      description: shop.description ?? 'N/A',
                      schedule: shop.horaires ?? [],
                      phoneNumber: shop.phonenumber ?? 'N/A',
                    );
                },
              ),
            ),
            Container(
                alignment : const FractionalOffset(0.5, 0.90),
                child: GreenRoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SellPoint(),
                        ),
                      );
                    },
                    buttonText: 'Ajouter un nouveau point de vente'
                )
            ),
          ],
        ),
      ),
    ]
    )
    )
    );
  }

  /// Search data from Firebase
  void searchFirebase(String id) {
    // Search shops
    FirebaseFirestore.instance
        .collection('shops')
        .where('id', isEqualTo: id)
        .get()
        .then((QuerySnapshot shopQuerySnapshot) {
      setState(() {
        shopResults = shopQuerySnapshot.docs.map((shopDoc) {
          return MyShop(
            name: shopDoc['name'],
            description: shopDoc['description'],
            adresse: shopDoc['adresse'],
            horaires: shopDoc['horaires'],
            note: 0,
            phonenumber: shopDoc['phonenumber'],
            longitude: shopDoc['longitude'],
            latitude: shopDoc['latitude'],
            id: shopDoc['id'],
          );
        }).toList();
      });
    });
  }

}

/// Card for each search result

class SearchProducerCard extends StatefulWidget {
  final String title;
  final String address;
  final String description;
  final List<dynamic> schedule;
  final String phoneNumber;

  const SearchProducerCard({
    required this.title,
    required this.address,
    required this.description,
    required this.schedule,
    required this.phoneNumber,
    super.key,
  });

  @override
  _SearchProducerCardState createState() => _SearchProducerCardState();
}

class _SearchProducerCardState extends State<SearchProducerCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetailsPage(
                shopName: widget.title,
                address: widget.address,
                schedule: widget.schedule,
                description: widget.description,
                phoneNumber: widget.phoneNumber,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(widget.title, style: text),
          subtitle: Row(
            children: [
              const Icon(
                Icons.pin_drop,
                color: darkGreen,
              ),
              const SizedBox(width: 8.0),
              Text(widget.address, style: textMedium),
            ],
          ),
        ),
      ),
    );
  }
}



getProductFromShop(String name) async {
  // Search products
    try {
      QuerySnapshot<Map<String, dynamic>> shopSnapshot =
          await FirebaseFirestore.instance.collection('product').where("producerId", isEqualTo: name).get();
      List<MyProduct> productResults = shopSnapshot.docs.map((productDoc) {
        return MyProduct(
          name: productDoc['name'],
          price: productDoc['price'],
          quantity:"0",
          unit: "0",
          description: productDoc['description'],
          categories: productDoc['categories'],
          labels: productDoc['labels'],
          image: productDoc['image'],
          composition: productDoc['composition'],
          producerId: productDoc['producerId'],
        );
      }).toList();

      return productResults;
    } catch (e) {
      print('Erreur lors de la récupération du shop associé : $e');
      return null;
    }
}



class ShopDetailsPage extends StatelessWidget {
  final String shopName;
  final String address;
  final String description;
  final List<dynamic> schedule;
  final String phoneNumber;

  const ShopDetailsPage({
    super.key,
    required this.shopName,
    required this.address,
    required this.description,
    required this.schedule,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    Future productList = getProductFromShop(shopName);
    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        title: const Text('Détails du lieu de production', style: boldTitre),
        backgroundColor: beige,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: beige,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: grey100.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shopName,
                style: text,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Description : $description',
                style: text,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Adresse : $address',
                style: text,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Horaires d\'ouverture : ',
                style: text,
              ),
              Text("Lun : ${schedule[0]}", style: text,),
              Text("Mar : ${schedule[1]}", style: text,),
              Text("Mer : ${schedule[2]}", style: text,),
              Text("Jeu : ${schedule[3]}", style: text,),
              Text("Ven : ${schedule[4]}", style: text,),
              Text("Sam : ${schedule[5]}", style: text,),
              Text("Dim : ${schedule[6]}", style: text,),


              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text(
                    'Contact : ',
                    style: text,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      phoneNumber,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: const FractionalOffset(0.5, 0.95),
        child: GreenRoundedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => AddProduct(
                ),
              ),
            );
          },
          buttonText: 'Ajouter un produit',
        ),
      ),
    );

  }
}
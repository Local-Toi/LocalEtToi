import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_repository/product_repository.dart';

import '../../utils/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: SearchPage(),
    );
  }
}

/// MyShop class with less fields than the one from the repo

class MyShop {
  final String name;
  final String description;
  final String address;
  final double mark;
  final List<dynamic> schedule;
  final String phoneNumber;

  MyShop({
    required this.name,
    required this.description,
    required this.address,
    required this.mark,
    required this.schedule,
    required this.phoneNumber,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<MyShop> shopResults = [];
  List<MyProduct> productResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: AppBar(
            backgroundColor: beige,
            elevation: 0,
            title: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              //padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: grey100),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) {
                        searchFirebase(query);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Rechercher...',
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shopResults.length + productResults.length,
                itemBuilder: (context, index) {
                  if (index < shopResults.length) {
                    // Display shop card
                    final shop = shopResults[index];
                    return SearchProducerCard(
                      title: shop.name,
                      address: shop.address,
                      description: shop.description,
                      schedule: shop.schedule,
                      phoneNumber: shop.phoneNumber,
                    );
                  } else {
                    // Display product card
                    final product = productResults[index - shopResults.length];
                    return SearchProductCard(
                      title: product.name ?? 'N/A',
                      price: product.price ?? 0,
                      description: product.description ?? 'N/A',
                      categories: product.categories ?? [],
                      labels: product.labels ?? [],
                      composition: product.composition ?? 'N/A',
                      image: product.image ?? 'N/A',
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Search data from Firebase
  void searchFirebase(String query) {
    // Search shops
    FirebaseFirestore.instance
        .collection('shops')
        .orderBy('name')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get()
        .then((QuerySnapshot shopQuerySnapshot) {
      setState(() {
        shopResults = shopQuerySnapshot.docs.map((shopDoc) {
          return MyShop(
            name: shopDoc['name'],
            description: shopDoc['description'],
            address: shopDoc['adresse'],
            mark: shopDoc['note'],
            schedule: shopDoc['horaires'],
            phoneNumber: shopDoc['phonenumber'],
          );
        }).toList();
      });
    });

    // Search products
    FirebaseFirestore.instance
        .collection('products')
        .orderBy('name')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get()
        .then((QuerySnapshot productQuerySnapshot) {
      setState(() {
        productResults = productQuerySnapshot.docs.map((productDoc) {
          return MyProduct(
            name: productDoc['name'],
            price: productDoc['price'],
            description: productDoc['description'],
            categories: productDoc['categories'],
            labels: productDoc['labels'],
            image: productDoc['image'],
            composition: productDoc['composition'],
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
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ),
      ),
    );
  }
}

class SearchProductCard extends StatefulWidget {
  final String title;
  final double price;
  final String description;
  final List<dynamic> categories;
  final List<dynamic> labels;
  final String composition;
  final String image;

  const SearchProductCard({
    required this.title,
    required this.price,
    required this.description,
    required this.categories,
    required this.labels,
    required this.composition,
    required this.image,
    super.key,
  });

  @override
  _SearchProductCardState createState() => _SearchProductCardState();
}

class _SearchProductCardState extends State<SearchProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
        },
        child: ListTile(
          title: Text(widget.title, style: text),
          subtitle: Row(
            children: [
              const Icon(
                Icons.euro_symbol,
                color: darkGreen,
              ),
              const SizedBox(width: 8.0),
              Text('${widget.price}€', style: textMedium),

            ],
          ),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ),
      ),
    );
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
                    child: Text(phoneNumber, style: const TextStyle(color: Colors.white),),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


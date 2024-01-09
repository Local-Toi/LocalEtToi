import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<MyShop> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: beige,
          elevation: 0,
          title: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final shop = searchResults[index];
                  return SearchCard(
                    title: shop.name,
                    description: shop.address,
                    schedule: shop.schedule,
                  );
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

    FirebaseFirestore.instance
        .collection('shops')
        .orderBy('name')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        searchResults = querySnapshot.docs.map((doc) {
          return MyShop(
            name: doc['name'],
            description: doc['description'],
            address: doc['adresse'],
            mark: doc['note'],
            schedule: doc['horaires'],
            phoneNumber: doc['phonenumber'],
          );
        }).toList();
      });
    });
  }


}

/// Card for each search result

class SearchCard extends StatefulWidget {
  final String title;
  final String description;
  final List<dynamic> schedule;

  const SearchCard({
    required this.title,
    required this.description,
    required this.schedule,
    super.key,
  });

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
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
                description: widget.description,
                schedule: widget.schedule,
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
              Text(widget.description, style: textMedium),
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
  final String description;
  final List<dynamic> schedule;

  const ShopDetailsPage({super.key,
    required this.shopName,
    required this.description,
    required this.schedule
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
              'Horaires d\'ouverture : $schedule',
              style: text,
            ),
          ],
        ),
      ),
    );
  }
}

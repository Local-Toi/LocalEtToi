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

  MyShop({
    required this.name,
    required this.description,
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
                    description: shop.description,
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
          );
        }).toList();
      });
    });
  }


}

/// Card for each search result

class SearchCard extends StatelessWidget {
  final String title;
  final String description;

  const SearchCard({
    required this.title,
    required this.description,
    super.key,
  });

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
                shopName: title,
                description: description,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
      ),
    );
  }
}

class ShopDetailsPage extends StatelessWidget {
  final String shopName;
  final String description;

  const ShopDetailsPage({super.key,
    required this.shopName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        title: const Text('Détails du Shop'),
        backgroundColor: beige,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom du Shop : $shopName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Description : $description',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

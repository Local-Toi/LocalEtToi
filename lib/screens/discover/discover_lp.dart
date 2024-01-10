import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../map/map_filters.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DiscoverLP extends StatelessWidget {
  const DiscoverLP({super.key});

  final String imageUrl = 'gs://local-et-toi.appspot.com/discovery/fruits&legumes/janvier/fruits_janv.png';

  Future<String> getImageUrl() async {
    // Récupérer l'URL de l'image depuis Firebase Storage
    String downloadURL = await FirebaseStorage.instance.ref(imageUrl).getDownloadURL();

    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afficher une image depuis Firebase Storage'),
      ),
      body: FutureBuilder<String>(
        future: getImageUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            }

            // Utiliser le widget Image.network pour afficher l'image
            return Image.network(
              snapshot.data!,
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}


    /*
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: constants.beige),
        child: Column(
          children: [

            //Titre
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'A découvrir',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  //Bouton filtres
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.tune,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MapFiltersState(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //<Carrousel vertical
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 120.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.vertical,
                ),
                items: List.generate(
                  10,
                      (index) => buildCard(),
                ),
              ),
            ),

            //Carousel horizontal avec photo
            CarouselSlider(
              options: CarouselOptions(
                height: 120.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              items: [
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('discovery_pictures')
                      .doc('fruits_janvier')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    final picture = snapshot.data;
                    if (picture == null || !picture.exists) {
                      return const Center(
                        child: Text('Document not found'),
                      );
                    }

                    final imageUrl = picture.data()?['path'] as String?;
                    return imageUrl != null ? buildPictureCard(imageUrl) : Container();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Afficher les cartes
  Widget buildCard() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: constants.beige,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  // Afficher les photos en DB
  Widget buildPictureCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}*/


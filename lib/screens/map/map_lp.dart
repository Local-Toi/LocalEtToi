import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:local_et_toi/model/shops.dart';

import 'map_filters.dart';


class MapLPState extends StatefulWidget {
  const MapLPState({
    super.key,
  });

  @override
  MapLP createState() => MapLP();
}

class MapLP extends State<MapLPState> {
  final controller = MapController.withUserPosition(
    trackUserLocation: const UserTrackingOption(
      enableTracking: true,
      unFollowUser: false,
    ),
  );

  TextEditingController searchController = TextEditingController();

  /*Future<void> _fetchShopsFromFirebase() async {
    final CollectionReference shops =
    FirebaseFirestore.instance.collection('shops');

    try {
      QuerySnapshot<Object?> querySnapshot =
      await shops.get();

      List<Shop> markers = [];

      querySnapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
        if (doc.exists) {
          final shop = doc.data();
          final double latitude = shop?['latitude'];
          final double longitude = shop?['longitude'];

          markers.add(
            Shop(
              producerId: shop?["0"],
              markerId: MarkerId(doc.id),
              position: LatLng(latitude, longitude),
              icon: Icon(Icons.pin_drop, color: Colors.blue),
              onTap: () {
                // Gérer l'événement de clic sur le marqueur si nécessaire
              }, id: null,
            ),
          );
        }
      } as void Function(QueryDocumentSnapshot<Object?> element));

      // Mettez à jour la carte avec les nouveaux marqueurs
      controller.addMarkers(markers);

    } catch (e) {
      print('Erreur lors de la récupération des magasins : $e');
    }
  }
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.all(8.0),
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
                          decoration: const InputDecoration(
                            hintText: 'Rechercher...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                            Icons.tune
                        ), onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MapFiltersState(),
                            ),
                          );
                      },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50, // Hauteur de la barre de recherche
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFBE2),
              ),
              child: OSMFlutter(
                controller: controller,
                osmOption: OSMOption(
                  userTrackingOption: const UserTrackingOption(
                    enableTracking: true,
                    unFollowUser: true,
                  ),
                  zoomOption: const ZoomOption(
                    initZoom: 15,
                    minZoomLevel: 3,
                    maxZoomLevel: 19,
                    stepZoom: 1.0,
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: 48,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
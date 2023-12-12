import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:local_et_toi/model/shops.dart';
import 'package:local_et_toi/utils/constants.dart';
import 'package:shop_repository/shop_repository.dart';

import 'map_filters.dart';

class MyCustomMarker {
  final double latitude;
  final double longitude;
  final String markerId;

  MyCustomMarker({
    required this.latitude,
    required this.longitude,
    required this.markerId,
  });
}

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

  FirebaseShopRepository _shopRepository = FirebaseShopRepository();

  List<MyCustomMarker> customMarkers = [];

  Future<void> _fetchShopsFromFirebase() async {
    try {
      List<MyShop> shops = await _shopRepository.getAllShops();

      customMarkers = shops.map((shop) {
        return MyCustomMarker(
          markerId: shop.id,
          latitude: shop.latitude as double,
          longitude: shop.longitude as double,
        );
      }).toList();
      controller.addMarker( )
      /*controller.addMarkers(customMarkers.map((customMarker) {
        return Marker(
          producerId: customMarker.markerId,
          markerId: MarkerId(customMarker.markerId),
          position: customMarker.position,
          icon: const MarkerIcon(
            icon: Icon(
              Icons.pin_drop,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            // afficher la liste par le bas
          },
        );
      }*/).toList());
    } catch (e) {
      print('Error fetching shops: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    _fetchShopsFromFirebase();
  }


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
                  markerOption: MarkerOption(
                defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: darkGreen50,
                  size: 56,
                ),
              )
            ),
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
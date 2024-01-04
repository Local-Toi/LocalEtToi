import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:local_et_toi/utils/constants.dart';
import 'package:shop_repository/shop_repository.dart';

import 'map_filters.dart';

/// Custom marker

class MyCustomMarker {
  final double latitude;
  final double longitude;
  final String markerId;
  final String shopName;

  MyCustomMarker({
    required this.latitude,
    required this.longitude,
    required this.markerId,
    required this.shopName,
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

  /// Fetch shops from Firebase
  Future<void> _fetchShopsFromFirebase() async {
    try {
      print("AVANT");
      List<MyShop> shops = await _shopRepository.getAllShops();

      print("LES SHOPS $shops");

      customMarkers = shops.map((shop) {
        return MyCustomMarker(
          markerId: shop.id,
          latitude: shop.latitude,
          longitude: shop.longitude,
          shopName: shop.name ?? "Nom du magasin non disponible",
        );
      }).toList();

      _addMarkersToMap();
    } catch (e) {
      print('Error fetching shops: $e $customMarkers');
    }
  }

  /// Add markers to the map
  void _addMarkersToMap() async {
    for (MyCustomMarker marker in customMarkers) {
      await controller.addMarker(
        GeoPoint(latitude: marker.latitude, longitude: marker.longitude),
        markerIcon: const MarkerIcon(
          icon: Icon(
            Icons.pin_drop,
            color: darkGreen,
            size: 52,
          ),
        ),
      );
    }
  }

  /// Check if a tap is close enough to a marker
  void _checkMarkerTap(GeoPoint tapLocation) {
    for (MyCustomMarker marker in customMarkers) {
      double distance = calculateDistance(
        tapLocation.latitude,
        tapLocation.longitude,
        marker.latitude,
        marker.longitude,
      );

      // Assuming a threshold of 50 meters for a marker tap
      if (distance < 50) {
        print("Marker tapped: ${marker.shopName}");
        _showMarkerDetails(marker);
      }
    }
  }

  /// Calculate distance between two coordinates
  double calculateDistance(
      double lat1,
      double lon1,
      double lat2,
      double lon2,
      ) {
    const double radius = 6371; // Earth radius in kilometers

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return radius * c;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  /// Show a DraggableScrollableSheet with marker information
  void _showMarkerDetails(MyCustomMarker marker) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          expand: true,
          builder: (context, controller) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Marker Details",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text("Shop Name: ${marker.shopName}"),
                  // Add more information as needed
                ],
              ),
            );
          },
        );
      },
    );
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
                        icon: const Icon(Icons.tune),
                        onPressed: () {
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
                onGeoPointClicked:
                    (geoPoint) {
                      _checkMarkerTap(geoPoint);
                    },
                osmOption: OSMOption(
                  showDefaultInfoWindow: false,
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

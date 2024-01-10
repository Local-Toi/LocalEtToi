import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/utils/constants.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import 'map_filters.dart';

class MyCustomMarker {
  final double latitude;
  final double longitude;
  final String markerId;
  final String shopName;
  final String phoneNumber;
  final String description;
  final String address;
  final double mark;
  final List<dynamic> schedule;

  MyCustomMarker({
    required this.latitude,
    required this.longitude,
    required this.markerId,
    required this.shopName,
    required this.phoneNumber,
    required this.description,
    required this.address,
    required this.mark,
    required this.schedule,
  });
}

class MapLPState extends StatefulWidget {
  const MapLPState({
    Key? key,
  }) : super(key: key);

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

  PanelController _panelController = PanelController();
  bool isPanelOpen = false;
  MyCustomMarker? selectedMarker;

  Future<void> _fetchShopsFromFirebase() async {
    try {
      print("AVANT");
      List<MyShop> shops = await _shopRepository.getAllShops();

      print("LES SHOPS $shops");

      customMarkers = shops.map((shop) {
        return MyCustomMarker(
          latitude: shop.latitude,
          longitude: shop.longitude,
          shopName: shop.name ?? "Nom du magasin non disponible",
          phoneNumber: shop.phonenumber ?? "N° de téléphone non disponible",
          description: shop.description ?? "Description non disponible",
          address: shop.adresse,
          mark: shop.note ?? 0.0,
          schedule: shop.horaires ?? ["Horaires non disponibles"],
          markerId: '',
        );
      }).toList();

      _addMarkersToMap();
    } catch (e) {
      print('Error fetching shops: $e $customMarkers');
    }
  }

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

  void _checkMarkerTap(GeoPoint tapLocation) {
    debugPrintGestureArenaDiagnostics = true;
    for (MyCustomMarker marker in customMarkers) {
      double distance = calculateDistance(
        tapLocation.latitude,
        tapLocation.longitude,
        marker.latitude,
        marker.longitude,
      );

      if (distance < 50) {
        print("Marker tapped: ${marker.shopName}");
        setState(() {
          selectedMarker = marker;
          isPanelOpen = true;
        });
        _panelController.open();
      }
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;

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

  void _showMarkerDetails(MyCustomMarker marker) {
    setState(() {
      selectedMarker = marker;
      isPanelOpen = true;
    });
    _panelController.open();
  }

  @override
  void initState() {
    super.initState();
    _fetchShopsFromFirebase();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_panelController.isPanelAnimating) {
        _panelController.close();
        setState(() {
          isPanelOpen = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        minHeight: isPanelOpen ? 50 : 0,
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        panelBuilder: () => _panel(),
        isDraggable: true,
        backdropEnabled: true,
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
              top: 50,
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
                  onGeoPointClicked: (geoPoint) {
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
      ),
    );
  }

  Widget _panel() {
    int currentDayOfWeek = DateTime.now().weekday;

    String getStatusText(String schedule) {
      return schedule == 'Fermé'
          ? 'Fermé'
          : 'Ouvert : $schedule';
    }

    return Container(
      //color: beige,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _panelController.close();
                  setState(() {
                    isPanelOpen = false;
                  });
                },
              ),
            ],
          ),
          if (selectedMarker != null)
            Row(
              children: [
                Text(
                  selectedMarker!.shopName,
                  style: boldTitre,
                ),
                const Icon(
                  Icons.favorite_border_outlined,
                  color: red,
                )
              ],
            ),
          const SizedBox(height: 8.0),
          if (selectedMarker != null)
            Text("Description : ${selectedMarker!.description}", style: text,),
          const SizedBox(height: 8.0),
          if (selectedMarker != null)
            Text(getStatusText(selectedMarker!.schedule[currentDayOfWeek - 1]), style: text,),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.pin_drop,
                color: darkGreen,
              ),
              const SizedBox(width: 8.0),
              if (selectedMarker != null)
                Text(selectedMarker!.address, style: text,),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.schedule,
                color: darkGreen,
              ),
              const SizedBox(width: 8.0),
              Column(
                children: [
                  if (selectedMarker != null)
                    Text("Lun : ${selectedMarker!.schedule[0]}", style: text,),
                  if (selectedMarker != null)
                    Text("Mar : ${selectedMarker!.schedule[1]}", style: text,),
                  if (selectedMarker != null)
                    Text("Mer : ${selectedMarker!.schedule[2]}", style: text,),
                  if (selectedMarker != null)
                    Text("Jeu : ${selectedMarker!.schedule[3]}", style: text,),
                  if (selectedMarker != null)
                    Text("Ven : ${selectedMarker!.schedule[4]}", style: text,),
                  if (selectedMarker != null)
                    Text("Sam : ${selectedMarker!.schedule[5]}", style: text,),
                  if (selectedMarker != null)
                    Text("Dim : ${selectedMarker!.schedule[6]}", style: text,),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: darkGreen,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                selectedMarker?.phoneNumber ?? "Numéro non disponible",
                style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

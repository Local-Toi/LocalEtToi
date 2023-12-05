import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart';


class MapFiltersState extends StatefulWidget {
  const MapFiltersState({
    super.key,
  });

  @override
  MapFilters createState() => MapFilters();
}

class MapFilters extends State<MapFiltersState>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Text("Filtrer les résultats",
            style: text
          ),
        ]
      )
    );
  }

}
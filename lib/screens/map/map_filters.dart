import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/buttons/buttons.dart';
import 'package:local_et_toi/utils/constants.dart';

class MapFiltersState extends StatefulWidget {
  const MapFiltersState({
    super.key,
  });

  @override
  MapFilters createState() => MapFilters();
}

class MapFilters extends State<MapFiltersState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Filtrer les résultats",
                  style: text,
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Recherche autour de moi : ", style: textMedium),
              SizedBox(
                width: 55.0,
                height: 55.0,
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    )
                  )
                ),
              ),
              Text(" km", style: textMedium),
            ],
          ),
          const Divider(
            color: Color(0xFFCBC6C6),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Catégories", style: textMedium)),
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              TagButton(onPressed: () {
                Navigator.pop(context);
              }, buttonText: "fruits")
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red, // Couleur du cœur (à adapter)
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Nom du produit', style: constants.titre),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: constants.grey85), // Couleur de la localisation (à adapter)
                    Text('Adresse du shop'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.euro, color: constants.grey85), // Couleur du prix (à adapter
                    Text('Prix XX.XX'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

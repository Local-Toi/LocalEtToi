import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget();

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
                  color: Colors.blue, // Couleur du Placeholder (à adapter)
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red, // Couleur du cœur (à adapter)
                ),
              ],
            ),
            Column(
              children: [
                Text('Nom du produit', style: TextStyle(fontSize: 20)),
                Text('Prix XX.XX€'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

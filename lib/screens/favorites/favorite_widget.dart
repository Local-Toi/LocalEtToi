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
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red, // Couleur du cœur (à adapter)
                ),
              ],
            ),
            Column(
              children: [
                Text('Nom du produit', style: constants.titre),
                Text('Prix XX.XX€'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

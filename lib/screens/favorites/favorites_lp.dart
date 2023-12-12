import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import 'favorties_produceurs.dart';
import 'favorties_products.dart';

class FavoritesLP extends StatelessWidget {
  const FavoritesLP({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Produits',
              ),
              Tab(
                text: 'Producteurs',
              ),
            ],
          ),
          title: const Center(
            child: Text(
              'Mes favoris',
              style: constants.titre,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FavortiesProducts(),
            FavoritesProduceurs(),
          ],
        ),
      ),
    );
  }
}

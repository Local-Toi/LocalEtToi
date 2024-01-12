import 'package:favorites_repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import 'favorites_producers.dart';
import 'favorites_products.dart';


// Implémentation en cours
/*
class FavoritesLP extends StatelessWidget {
  const FavoritesLP({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFavoriteRepository favoriteRepository = FirebaseFavoriteRepository();

    //List<String> productFavorites = favoriteRepository.getFavoritesData();

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
        body: TabBarView(
          children: [
            FavoritesProducts(
              favorites: favoriteRepository.getFavorites(),
            ),
            FavoritesProduceurs(),
          ],
        ),
      ),
    );
  }
}*/

class FavoritesLP extends StatelessWidget {
  const FavoritesLP({Key? key});

  @override
  Widget build(BuildContext context) {
    FirebaseFavoriteRepository favoriteRepository = FirebaseFavoriteRepository();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: favoriteRepository.getFavoritesData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("Aucun favori disponible."));
            }

            // Separate favorites into products and shops
            List<Map<String, dynamic>> productFavorites =
                snapshot.data!.where((fav) => fav['ref'].toString().contains('products')).toList();
            List<Map<String, dynamic>> shopFavorites =
                snapshot.data!.where((fav) => fav['ref'].toString().contains('shops')).toList();

            return TabBarView(
              children: [
                productFavorites.isNotEmpty
                    ? FavoritesProducts(favorites: productFavorites)
                    : Center(child: Text('Aucun favori de produit')),
                shopFavorites.isNotEmpty
                    ? FavoritesProducers(favorites: shopFavorites)
                    : Center(child: Text('Aucun favori de producteur')),
              ],
            );
          },
        ),
      ),
    );
  }
}

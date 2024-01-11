import 'package:favorites_repository/favorite_repository.dart';
import 'package:flutter/material.dart';

import 'favorite_widget.dart';

class FavoritesProducts extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  const FavoritesProducts({Key? key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0),
              child: Column(
                children: List.generate(
                  favorites.length,
                  (index) => FavoriteWidget(
                    id: favorites[index]['ref'].toString(), // Utilisez l'ID approprié de votre modèle de données
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:favorites_repository/favorite_repository.dart';
import 'package:flutter/material.dart';

import 'favorite_widget.dart';

<<<<<<< HEAD
import 'favorite_widget.dart';

class FavortiesProducts extends StatelessWidget {
  const FavortiesProducts({super.key});
=======
class FavoritesProducts extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  const FavoritesProducts({Key? key, required this.favorites});
>>>>>>> e5dc33f83021a307862c07f16bbee97ec304ddd2

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

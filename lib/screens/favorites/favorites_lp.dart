import 'package:flutter/material.dart';

class FavoritesLP extends StatelessWidget {
  const FavoritesLP({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Produits",
              ),
              Tab(
                text: "Points de vente",
              ),
              Tab(
                text: "Producteurs",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

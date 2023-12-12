import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class FavortiesProducts extends StatelessWidget {
  const FavortiesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 4;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0),
              child: Column(
                children: List.generate(
                  items,
                  (index) => FavoriteWidget(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
                ],
              ),
              const Column(
                children: [
                  Text('Nom du produit'),
                  Text('Prix XX.XX€'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.favorite),
                      color: constants.red,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

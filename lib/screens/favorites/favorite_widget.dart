import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

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
                      onPressed: () {
                        // TODO: Remove from favorites
                        print('Remove favorite');
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import '../map/map_filters.dart';

class DiscoverLP extends StatelessWidget {
  const DiscoverLP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: constants.beige),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Centrer le titre
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'A découvrir',
                        style: constants.titre,
                      ),
                    ),
                  ),

                  // icone de filtre (le meme que celui de la map mais surement revoir le back
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.tune,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MapFiltersState(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

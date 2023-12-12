import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import 'favorite_widget.dart';

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
                  (index) => const FavoriteWidget(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

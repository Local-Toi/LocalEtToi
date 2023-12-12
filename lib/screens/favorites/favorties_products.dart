import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class FavortiesProducts extends StatelessWidget {
  const FavortiesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemWidget(text: 'Item 1'),
                  ItemWidget(text: 'Item 2'),
                  ItemWidget(text: 'Item 3'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}

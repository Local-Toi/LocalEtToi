import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget{

  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 26,
      top: 40,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 35,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
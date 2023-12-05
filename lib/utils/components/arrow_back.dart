import 'package:flutter/material.dart';
import '../../screens/home/home_screen.dart';

class ArrowBack extends StatelessWidget{
  final VoidCallback onPressed;

  const ArrowBack({
    required this.onPressed,
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
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart';

class GreenRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const GreenRoundedButton({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height /20.6,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: SizedBox(
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: textBeige,
            ),
          ),
        ),
      ),
    );
  }
}

class RedRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const RedRoundedButton({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: beige,
          side: const BorderSide(
            color: red,
            width: 1,
          ),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: SizedBox(
          width: 300,
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransparentRoundedButtonWithBorder extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const TransparentRoundedButtonWithBorder({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height /20.6,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: darkGreen,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: SizedBox(
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: textDarkGreen,
              ),
            ),
          ),
        ),
    );
  }
}

class TagButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const TagButton({
    required this.onPressed,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonText.length.toDouble() * 15.0,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: darkGreen50,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF095D40),
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
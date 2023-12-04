import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

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
          backgroundColor: constants.darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: SizedBox(
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: constants.textBeige,
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
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        child: Center(
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}


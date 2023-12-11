import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

import '../constants.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height /20.6,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: constants.darkGreen,
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
              style: const TextStyle(
                color: Color(0xFF095D40),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );

  }
}


class TagButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const TagButton({
    required this.onPressed,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  _TagButtonState createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.buttonText.length.toDouble() * 15.0,
      height: 40,
      decoration: BoxDecoration(
        color: isPressed ? Color(0xFF095D40) : Colors.transparent,
        border: Border.all(
          width: 2,
          color: constants.darkGreen50,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
          widget.onPressed();
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isPressed ? Colors.white : Color(0xFF095D40),
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

class ImageSelectionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String imagePath;

  const ImageSelectionButton({
    required this.onPressed,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSelectionButtonState createState() => _ImageSelectionButtonState();
}

class _ImageSelectionButtonState extends State<ImageSelectionButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isPressed ? const Color(0xFF095D40) : Colors.transparent,
        border: Border.all(
          width: 2,
          color: darkGreen50,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
          widget.onPressed();
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Image.asset(
          widget.imagePath,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}



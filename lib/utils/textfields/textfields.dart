import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class GreenTextFieldWithGreenerBorderObscured extends GreenTextFieldWithGreenerBorder {
  final bool obscureText;
  final FocusNode focusNode;
  const GreenTextFieldWithGreenerBorderObscured(
      {super.key,
      required this.obscureText,
      required this.focusNode,
      required super.keyboardType,
      required super.onSaved,
      required super.validator,
      super.controller});

}

class GreenTextFieldWithGreenerBorder extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const GreenTextFieldWithGreenerBorder({
    super.key,
    this.onSaved,
    this.validator,
    this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: constants.lightGreen,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: constants.darkGreen,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: constants.darkGreen,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          border: InputBorder.none,
          //floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
        ),
      ),
    );
  }
}

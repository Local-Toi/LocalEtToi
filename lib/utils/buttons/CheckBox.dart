import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

class CheckboxGreen extends StatefulWidget {
  const CheckboxGreen({super.key});

  @override
  State<CheckboxGreen> createState() => _CheckboxGreenState();
}

class _CheckboxGreenState extends State<CheckboxGreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return constants.darkGreen;
      }
      return constants.beige;
    }

    return Checkbox(
      checkColor: constants.darkGreen,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 1.0, color: constants.darkGreen)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

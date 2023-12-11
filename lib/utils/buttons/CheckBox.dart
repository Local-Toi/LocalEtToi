import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart';

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
        return beige;
      }
      return beige;
    }

    return Checkbox(
      checkColor: darkGreen,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

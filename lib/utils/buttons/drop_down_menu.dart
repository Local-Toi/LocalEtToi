import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatefulWidget {
  final List<String> itemList;

  const DropdownMenuWidget({Key? key, required this.itemList}) : super(key: key);

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.itemList.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.itemList.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: widget.itemList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

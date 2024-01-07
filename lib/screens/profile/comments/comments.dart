import 'package:flutter/material.dart';
import 'package:local_et_toi/utils/constants.dart' as constants;

void main()  {
  runApp(const MaterialApp(
    home: Scaffold(
      body: CommentsPage(),
    ),
  ));
}

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color : constants.beige),
        )
    );
  }

}
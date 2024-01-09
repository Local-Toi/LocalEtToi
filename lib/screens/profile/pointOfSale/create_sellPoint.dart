import 'package:flutter/material.dart';


class create_sellpoint extends StatefulWidget {
  const create_sellpoint({super.key});

  @override
  _createSellpointState createState() => _createSellpointState();
}

class _createSellpointState extends State<create_sellpoint> {
  final formKey = GlobalKey<FormState>();
  late String identifiant, nom, prenom, email;

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFFFFBE2)),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 39,
              child: Center(
                child: Text(
                  'Inscription',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
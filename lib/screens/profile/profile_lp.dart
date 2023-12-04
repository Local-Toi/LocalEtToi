import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:local_et_toi/blocs/sign_in_bloc/sign_in_bloc.dart';

class ProfileLP extends StatelessWidget {
  const ProfileLP({super.key});

  @override
  Widget build(BuildContext context) {
    // return logout button
    return ElevatedButton(
      onPressed: () {
        print("logout TODO");
      },
      child: const Text('Logout'),
    );
  }
}

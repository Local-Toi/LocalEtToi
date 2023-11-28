import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:local_et_toi/app.dart';
<<<<<<< HEAD

import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp(FirebaseUserRepository()));
}

/*

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_et_toi/Routes/generated_routes.dart';
import 'package:local_et_toi/views/landing_page_connexion.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
=======

import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp(FirebaseUserRepository()));
}

/*

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_et_toi/Routes/generated_routes.dart';
import 'package:local_et_toi/views/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
>>>>>>> a2e943e9874958533f5f98f65c70f9295e8150c9
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MainView(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local & Toi',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_page',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}

*/
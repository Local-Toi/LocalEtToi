void main() => runApp(const App());

/*

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_et_toi/Routes/generated_routes.dart';
import 'package:local_et_toi/views/landing_page_connexion.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:local_et_toi/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

/*

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_et_toi/Routes/generated_routes.dart';
import 'package:local_et_toi/views/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SignInPage(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
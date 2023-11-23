import 'package:flutter/material.dart';
import 'package:local_et_toi/views/sign_in.dart';

void main() {
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
      initialRoute: '/landing_page',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}

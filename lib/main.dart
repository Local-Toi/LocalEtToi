import 'package:flutter/material.dart';
import 'package:local_et_toi/Routes/generated_routes.dart';

void main() async {
  runApp(const MyApp());
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

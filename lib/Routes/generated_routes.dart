import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/Bloc/navigation_bloc/navigation_bloc.dart';
import 'package:local_et_toi/views/home.dart';
import 'package:local_et_toi/views/navigation.dart';

class RouteGenerator {
  final NavigationBloc navigationBloc = NavigationBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/landing_page':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigationBloc>.value(
                  value: navigationBloc,
                  child: const Navigation(),
                ));

      case '/home_page':
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

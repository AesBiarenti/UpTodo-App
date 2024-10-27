// lib/routes.dart
import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/pages/start/welcome_page.dart';


class AppRoutes {
  static const String welcome = '/welcome';
  static const String startSecond = '/startSecond';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

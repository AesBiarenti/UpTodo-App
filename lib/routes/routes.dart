// lib/routes.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/pages/auth/auth_page.dart';
import 'package:uptodo_app/presentation/pages/auth/login/login_page.dart';
import 'package:uptodo_app/presentation/pages/auth/register/create_account_page.dart';
import 'package:uptodo_app/presentation/pages/start/welcome_page.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String authPage = "/auth";
  static const String loginPage = "/login";
  static const String signupPage = "/signup";
  static const String homePage = "/home";
  static const String userPage = "/user";
  static const String taskPage = "/task";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case authPage:
        return CupertinoPageRoute(builder: (context) => const AuthPage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signupPage:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

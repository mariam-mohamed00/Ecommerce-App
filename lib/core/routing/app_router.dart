import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:app_e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:app_e_commerce/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (context) => const RegisterScreen(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}

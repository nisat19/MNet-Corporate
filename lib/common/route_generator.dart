import 'package:flutter/material.dart';
import 'package:mnet_corporate/views/error/404_error.dart';
import 'package:mnet_corporate/views/auth/signin.dart';
import 'package:mnet_corporate/views/home/ground.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/Ground':
        return MaterialPageRoute(builder: (_) => const Ground());
      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mnet_corporate/views/404_error.dart';
import 'package:mnet_corporate/views/auth/signin.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}

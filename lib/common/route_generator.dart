import 'package:flutter/material.dart';
import 'package:mnet_corporate/views/error/404_error.dart';
import 'package:mnet_corporate/views/auth/signin.dart';
import 'package:mnet_corporate/views/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/Home':
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}

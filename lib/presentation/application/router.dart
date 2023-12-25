import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/login/sign_in_page.dart';

import '../splash/splash_page.dart';

class RoutePaths {
  static const String prefix = 'Clean Architect';
  static const String splash = '/';
  static const String login = '/$prefix/login';
  static const String home = '/$prefix/home';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? path = settings.name;
    // Use for argument passing
    // final arguments = settings.arguments;

    switch (path) {
      case RoutePaths.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashPage(),
        );
      case RoutePaths.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignInPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
              body: Center(
            child: Text(
              'Page not found',
            ),
          )),
        );
    }
  }
}

class BasePageRoute {}

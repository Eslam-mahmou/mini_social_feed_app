import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/routes/routes_page.dart';
import '../../presentation/auth/view/sign_in_screen.dart';
import '../../presentation/auth/view/sign_up_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPage.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case RoutesPage.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
          settings: settings,
        );
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}

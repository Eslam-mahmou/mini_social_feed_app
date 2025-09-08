import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/routes/routes_page.dart';
import 'package:mini_social_feed/presentation/sign_in/view/sign_in_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPage.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
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

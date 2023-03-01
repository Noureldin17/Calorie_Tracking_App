import 'package:fitness_app/presentation/screens/LoginPage.dart';
import 'package:fitness_app/presentation/screens/OnBoardingPage.dart';
import 'package:flutter/material.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = OnBoardingPage();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      default:
        return null;
    }
  }
}

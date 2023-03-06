import 'package:fitness_app/presentation/screens/AppMainPage.dart';
import 'package:fitness_app/presentation/screens/authentication/LoginPage.dart';
import 'package:fitness_app/presentation/screens/OnBoardingPage.dart';
import 'package:flutter/material.dart';
import '../constants/pages.dart' as pages;

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = OnBoardingPage();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case pages.Login_Page:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case pages.App_Main_Page:
        return MaterialPageRoute(builder: (_) => AppMainPage());
      default:
        return null;
    }
  }
}

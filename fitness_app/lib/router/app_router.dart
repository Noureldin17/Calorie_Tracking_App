import 'package:fitness_app/business_logic/cubit/main_page_cubit.dart';
import 'package:fitness_app/presentation/screens/AppMainPage.dart';
import 'package:fitness_app/presentation/screens/authentication/LoginPage.dart';
import 'package:fitness_app/presentation/screens/OnBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/pages.dart' as pages;

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = OnBoardingPage();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case pages.App_Main_Page:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MainPageCubit(),
                  child: AppMainPage(),
                ));
      case pages.Login_Page:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return null;
    }
  }
}

import 'package:fitness_app/business_logic/cubit/recipes_cubit.dart';
import 'package:fitness_app/business_logic/cubit/recipes_page_cubit.dart';
import 'package:fitness_app/data/repository/recipes_repository.dart';
import 'package:fitness_app/data/web_services/recipes_web_service.dart';
import 'package:fitness_app/presentation/screens/main/DiaryPage.dart';
import 'package:fitness_app/presentation/screens/main/HomePage.dart';
import 'package:fitness_app/presentation/screens/main/ProfilePage.dart';
import 'package:fitness_app/presentation/screens/main/RecipesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageInitial());

  static MainPageCubit get(context) => BlocProvider.of<MainPageCubit>(context);

  int currentIndex = 0;
  var visited = [0];

  late List<Widget> Screens;

  void initPages() {
    Screens = [
      BlocProvider(
        create: (context) =>
            RecipesCubit(RecipesRepository(RecipesWebService())),
        child: HomePage(),
      ),
      visited.contains(1)
          ? MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        RecipesCubit(RecipesRepository(RecipesWebService()))),
                BlocProvider(
                    create: (context) => RecipesPageCubit(
                        RecipesRepository(RecipesWebService()))),
              ],
              child: RecipesPage(),
            )
          : Container(),
      visited.contains(2) ? DiaryPage() : Container(),
      visited.contains(3) ? ProfilePage() : Container(),
    ];
  }

  void changePage(int index) {
    currentIndex = index;
    visited.add(index);
    initPages();
    emit(MainPageChanged());
  }
}

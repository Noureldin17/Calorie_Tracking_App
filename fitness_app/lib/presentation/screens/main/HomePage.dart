import 'package:fitness_app/business_logic/cubit/recipes_cubit.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeCalorieMetrics.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomePageDiaryCard.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeProfileBanner.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/RecipesItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/recipe_model.dart';
import '../../colors.dart' as colors;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  late RecipesCubit cubit;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  @override
  void initState() {
    super.initState();
    widget.cubit = RecipesCubit.get(context);
    // recipes = widget.cubit.getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => SafeArea(
            child: Scaffold(
                backgroundColor: colors.BackgroundColor,
                body: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HomeProfileBanner(),
                    HomeDiaryCard(),
                    HomeCalorieMetrics(),
                    BlocBuilder<RecipesCubit, RecipesState>(
                      builder: (context, state) {
                        if (state is RecipesLoaded) {
                          recipes = state.recipes;
                          print(state.recipes[0].Label);
                          return Text(state.recipes[0].Label!);
                        } else {
                          return Text('No Recipes');
                        }
                      },
                    ),
                    RecipesItem(
                        RecipeName: 'RecipeName', RecipeImage: 'RecipeImage')
                  ],
                )))));
  }
}

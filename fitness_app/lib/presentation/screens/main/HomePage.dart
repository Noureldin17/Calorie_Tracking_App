import 'package:fitness_app/business_logic/cubit/recipes_cubit.dart';
import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomePageDiaryCard.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeProfileBanner.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/RecipesItem.dart';
import 'package:fitness_app/presentation/widgets/RecipeHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/recipe_model.dart';
import '../../colors.dart' as colors;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RecipesCubit cubit;
  List<Recipe> recipes = [];
  List<Recipe> HPrecipes = [];
  @override
  void initState() {
    super.initState();
    cubit = RecipesCubit.get(context);
    recipes = cubit.getBalancedRecipes();
    HPrecipes = cubit.getHighProteinRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => SafeArea(
            bottom: false,
            child: Scaffold(
                extendBody: true,
                backgroundColor: colors.BackgroundColor,
                body: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HomeProfileBanner(),
                    HomeDiaryCard(),
                    Padding(
                      padding: EdgeInsets.only(left: 16.sp, top: 10.sp),
                      child: DefaultText.Bold(
                          text: 'Check out some recipes',
                          textcolor: colors.PrimaryTextColor,
                          size: 18.sp),
                    ),
                    BlocBuilder<RecipesCubit, RecipesState>(
                      builder: (context, state) {
                        if (state is RecipesLoaded) {
                          recipes = state.recipes;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RecipeHeader(
                                  HeaderText: 'Balanced', OnViewMore: () {}),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.sp, left: 6.sp, right: 16.sp),
                                  child: Row(
                                    children: [
                                      ...recipes.map((recipe) => RecipesItem(
                                          Ingredients: recipe.Ingredients!,
                                          Calories: (recipe.Calories! /
                                                  recipe.Weight!) *
                                              100,
                                          RecipeName: recipe.Label!,
                                          RecipeImage: recipe.ImageUrl!,
                                          DietLabel: recipe.DietLabels![0]))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is RecipesLoading) {
                          return Padding(
                            padding: EdgeInsets.only(top: 50.sp),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: colors.PrimaryTextColor,
                            )
                                // Image.asset(
                                //   'assets/Spinner.gif',
                                //   height: 70.sp,
                                //   width: 70.sp,
                                // ),
                                ),
                          );
                        } else if (state is RecipesLoadError) {
                          return Text('ERROR LOADING DATA...');
                        } else {
                          return Text('data');
                        }
                      },
                    ),
                    BlocBuilder<RecipesCubit, RecipesState>(
                      builder: (context, state) {
                        if (state is RecipesLoaded) {
                          HPrecipes = state.highproteinrecipes;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RecipeHeader(
                                  HeaderText: 'High-Protein',
                                  OnViewMore: () {}),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.sp, left: 6.sp, right: 16.sp),
                                  child: Row(
                                    children: [
                                      ...HPrecipes.map((recipe) => RecipesItem(
                                          Ingredients: recipe.Ingredients!,
                                          Calories: (recipe.Calories! /
                                                  recipe.Weight!) *
                                              100,
                                          RecipeName: recipe.Label!,
                                          RecipeImage: recipe.ImageUrl!,
                                          DietLabel: recipe.DietLabels![0])),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is RecipesLoading) {
                          return Padding(
                            padding: EdgeInsets.only(top: 100.sp),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: colors.PrimaryTextColor,
                            )),
                          );
                        } else {
                          return Center(
                            child: Image.asset(
                              'assets/illustrations/404-error.png',
                              height: 200.sp,
                              width: 200.sp,
                            ),
                          );
                        }
                      },
                    ),
                    Padding(padding: EdgeInsets.all(40.sp))
                  ],
                )))));
  }
}

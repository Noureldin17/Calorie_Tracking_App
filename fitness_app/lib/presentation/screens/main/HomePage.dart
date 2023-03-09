import 'package:fitness_app/business_logic/cubit/recipes_cubit.dart';
import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomePageDiaryCard.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeProfileBanner.dart';
import 'package:fitness_app/presentation/widgets/RecipesScrollView.dart';
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
                        if (state is RecipesLoaded ||
                            state is HPRecipesLoaded) {
                          recipes = cubit.recipes;
                          HPrecipes = cubit.highproteinrecipes;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RecipesScrollView(
                                  recipes: recipes,
                                  recipesType: 'Balanced',
                                  OnViewMore: () {}),
                              RecipesScrollView(
                                  recipes: HPrecipes,
                                  recipesType: 'High-Protein',
                                  OnViewMore: () {}),
                            ],
                          );
                        } else if (state is RecipesLoading ||
                            state is HPRecipesLoading) {
                          return Padding(
                            padding: EdgeInsets.only(top: 50.sp),
                            child: Column(
                              children: [
                                Center(
                                    child: CircularProgressIndicator(
                                  color: colors.PrimaryTextColor,
                                )),
                                Padding(padding: EdgeInsets.all(40.sp)),
                                Center(
                                    child: CircularProgressIndicator(
                                  color: colors.PrimaryTextColor,
                                )),
                              ],
                            ),
                          );
                        } else if (state is RecipesLoadError) {
                          return Text('ERROR LOADING DATA...');
                        } else {
                          return Text('data');
                        }
                      },
                    ),
                    Padding(padding: EdgeInsets.all(40.sp))
                  ],
                )))));
  }
}

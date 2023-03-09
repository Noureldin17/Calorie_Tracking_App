import 'package:fitness_app/business_logic/cubit/recipes_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/recipe_model.dart';
import '../../colors.dart' as colors;
import '../../widgets/DefaultText.dart';
import '../../widgets/RecipesScrollView.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});
  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late RecipesPageCubit cubit;

  List<Recipe> KetoRecipes = [];
  List<Recipe> GlutenFreeRecipes = [];
  List<Recipe> LowFatRecipes = [];
  List<Recipe> LowCarbRecipes = [];
  @override
  void initState() {
    cubit = RecipesPageCubit.get(context);
    KetoRecipes = cubit.getKetoRecipes();
    GlutenFreeRecipes = cubit.getGlutenFreeRecipes();
    LowCarbRecipes = cubit.getLowCarbRecipes();
    LowFatRecipes = cubit.getLowFatRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: colors.BackgroundColor,
            body: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.sp, left: 0.sp, bottom: 10.sp),
                  child: Center(
                    child: DefaultText.Bold(
                        text: 'Recipes',
                        textcolor: colors.PrimaryTextColor,
                        size: 22.sp),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<RecipesPageCubit, RecipesPageState>(
                          builder: (context, state) {
                            if (state is KetoRecipesLoaded ||
                                state is GlutenRecipesLoaded ||
                                state is LowCarbRecipesLoaded ||
                                state is LowFatRecipesLoaded) {
                              KetoRecipes = cubit.KetoRecipes;
                              GlutenFreeRecipes = cubit.GlutenFreeRecipes;
                              LowCarbRecipes = cubit.LowCarbRecipes;
                              LowFatRecipes = cubit.LowFatRecipes;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RecipesScrollView(
                                      recipes: KetoRecipes,
                                      recipesType: 'Ketogenic',
                                      OnViewMore: () {}),
                                  RecipesScrollView(
                                      recipes: GlutenFreeRecipes,
                                      recipesType: 'Gluten-Free',
                                      OnViewMore: () {}),
                                  RecipesScrollView(
                                      recipes: LowCarbRecipes,
                                      recipesType: 'Low-Carb',
                                      OnViewMore: () {}),
                                  RecipesScrollView(
                                      recipes: LowFatRecipes,
                                      recipesType: 'Low-Fat',
                                      OnViewMore: () {}),
                                  Padding(padding: EdgeInsets.all(40.sp)),
                                ],
                              );
                            } else if (state is KetoRecipesLoading ||
                                state is GlutenRecipesLoading ||
                                state is LowCarbRecipesLoading ||
                                state is LowFatRecipesLoading) {
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
                                    Padding(padding: EdgeInsets.all(40.sp)),
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
                            } else {
                              return Text('ERROR');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

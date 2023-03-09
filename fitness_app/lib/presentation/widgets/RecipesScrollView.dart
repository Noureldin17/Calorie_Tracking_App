import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'HomePageWidgets/RecipesItem.dart';
import 'RecipeHeader.dart';

class RecipesScrollView extends StatefulWidget {
  const RecipesScrollView({
    super.key,
    required this.recipes,
    required this.recipesType,
    required this.OnViewMore,
  });
  final List<Recipe> recipes;
  final String recipesType;
  final Function OnViewMore;
  @override
  State<RecipesScrollView> createState() => _RecipesScrollViewState();
}

class _RecipesScrollViewState extends State<RecipesScrollView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecipeHeader(
            HeaderText: widget.recipesType, OnViewMore: widget.OnViewMore),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(top: 10.sp, left: 6.sp, right: 16.sp),
            child: Row(
              children: [
                ...widget.recipes.map((recipe) => RecipesItem(
                      recipe: recipe,
                      category: widget.recipesType,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

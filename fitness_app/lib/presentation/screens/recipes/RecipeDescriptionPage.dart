import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:fitness_app/presentation/widgets/PrimaryButton.dart';
import 'package:fitness_app/presentation/widgets/RecipePageWidgets/AddRecipeModalSheet.dart';
import 'package:fitness_app/presentation/widgets/RecipePageWidgets/RecipeMacros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

import '../../../data/models/recipe_model.dart';

class RecipeDescriptionPage extends StatefulWidget {
  const RecipeDescriptionPage({super.key, required this.recipe});
  final Recipe recipe;
  @override
  State<RecipeDescriptionPage> createState() => _RecipeDescriptionPageState();
}

class _RecipeDescriptionPageState extends State<RecipeDescriptionPage> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    controller.text = '100';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.network(
                        widget.recipe.ImageUrl!,
                        width: 100.w,
                        height: 230.sp,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 130.sp,
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.sp, 34.sp, 10.sp, 10.sp),
                          height: 100.sp,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  bottomRight: Radius.circular(22)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Color.fromARGB(244, 0, 0, 0)
                                  ])),
                          child: DefaultText.Overflow(
                              text: widget.recipe.Label!,
                              textcolor: Colors.white,
                              size: 18.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.sp, left: 4.sp),
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/arrows/arrow-left.svg',
                            color: Colors.white,
                            height: 20.sp,
                            width: 20.sp,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...widget.recipe.HealthLabels!.map((label) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.sp),
                            child: Container(
                              padding: EdgeInsets.all(6.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                    color: colors.PrimaryColor, width: 2),
                              ),
                              child: DefaultText.Bold(
                                  text: label,
                                  textcolor: colors.PrimaryColor,
                                  size: 12.sp),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.sp, left: 8.sp),
                  child: DefaultText.Bold(
                      text: 'Nutrients Per Serving (100g)',
                      textcolor: colors.PrimaryTextColor,
                      size: 14.sp),
                ),
                RecipeMacros(recipe: widget.recipe),
                Padding(
                  padding: EdgeInsets.only(top: 10.sp, left: 10.sp),
                  child: DefaultText.Bold(
                      text:
                          'Ingredients (for ${widget.recipe.Weight!.floor()}g)',
                      textcolor: colors.PrimaryTextColor,
                      size: 14.sp),
                ),
                Padding(padding: EdgeInsets.all(8.sp)),
                ...widget.recipe.Ingredients!.map((ingredient) {
                  return Padding(
                    padding: EdgeInsets.only(left: 14.sp, right: 10.sp),
                    child: DefaultText.SemiBold(
                        text: '-  ' + ingredient,
                        textcolor: colors.SecondaryTextColor,
                        size: 12.sp),
                  );
                })
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
          child: PrimaryButton(
              buttonText: 'Add to diary',
              OnPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  )),
                  context: context,
                  builder: (context) {
                    return RecipeModalSheet(
                      controller: controller,
                      CaloriesPerServing:
                          ((widget.recipe.Calories! / widget.recipe.Weight!) *
                              100),
                      CarbsPerServing:
                          ((widget.recipe.Carbs! / widget.recipe.Weight!) *
                              100),
                      ProteinPerServing:
                          ((widget.recipe.Proteins! / widget.recipe.Weight!) *
                              100),
                      FatsPerServing:
                          ((widget.recipe.Fats! / widget.recipe.Weight!) * 100),
                    );
                  },
                );
              }),
        )
      ]),
    );
  }
}

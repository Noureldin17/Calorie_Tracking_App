import 'package:fitness_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;
import '../DefaultText.dart';

class RecipeMacros extends StatefulWidget {
  const RecipeMacros({super.key, required this.recipe});
  final Recipe recipe;
  @override
  State<RecipeMacros> createState() => _RecipeMacrosState();
}

class _RecipeMacrosState extends State<RecipeMacros> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 8.sp),
          child: Container(
            height: 80.sp,
            width: 80.sp,
            decoration: BoxDecoration(
                border: Border.all(color: colors.PrimaryTextColor, width: 2),
                borderRadius: BorderRadius.circular(22)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText.Bold(
                    text: 'Calories',
                    textcolor: colors.PrimaryTextColor,
                    size: 14.sp),
                DefaultText.SemiBold(
                    text: ((widget.recipe.Calories! / widget.recipe.Weight!) *
                                100)
                            .floor()
                            .toString() +
                        ' Kcal',
                    textcolor: colors.SecondaryTextColor,
                    size: 14.sp),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 8.sp),
          child: Container(
            height: 60.sp,
            width: 60.sp,
            decoration: BoxDecoration(
                color: Color(0xFFFFC4C4),
                borderRadius: BorderRadius.circular(22)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText.Bold(
                    text: 'Protein',
                    textcolor: colors.PrimaryTextColor,
                    size: 14.sp),
                DefaultText.Bold(
                    text: ((widget.recipe.Proteins! / widget.recipe.Weight!) *
                                100)
                            .floor()
                            .toString() +
                        ' g',
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 8.sp),
          child: Container(
            height: 60.sp,
            width: 60.sp,
            decoration: BoxDecoration(
                color: Color(0xFFFCF9BE),
                borderRadius: BorderRadius.circular(22)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText.Bold(
                    text: 'Carbs',
                    textcolor: colors.PrimaryTextColor,
                    size: 14.sp),
                DefaultText.Bold(
                    text: ((widget.recipe.Carbs! / widget.recipe.Weight!) * 100)
                            .floor()
                            .toString() +
                        ' g',
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 8.sp),
          child: Container(
            height: 60.sp,
            width: 60.sp,
            decoration: BoxDecoration(
                color: colors.CardBackgroundColor,
                borderRadius: BorderRadius.circular(22)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText.Bold(
                    text: 'Fats',
                    textcolor: colors.PrimaryTextColor,
                    size: 14.sp),
                DefaultText.Bold(
                    text: ((widget.recipe.Fats! / widget.recipe.Weight!) * 100)
                            .floor()
                            .toString() +
                        ' g',
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

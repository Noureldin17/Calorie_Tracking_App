import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import '../../../data/models/recipe_model.dart';
import '../../../constants/pages.dart' as pages;
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

class RecipesItem extends StatefulWidget {
  const RecipesItem({
    super.key,
    required this.recipe,
    required this.category,
  });

  final Recipe recipe;
  final String category;
  @override
  State<RecipesItem> createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp),
      child: InkWell(
        onTap: (() {
          Navigator.pushNamed(context, pages.Recipe_Description_Page,
              arguments: widget.recipe);
        }),
        child: Container(
          width: 125.sp,
          height: 145.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                child: Stack(
                  children: [
                    Image.network(
                      widget.recipe.ImageUrl!,
                      height: 80.sp,
                      width: 125.sp,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.sp),
                child: DefaultText.Overflow(
                    text: widget.recipe.Label!,
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.sp, 0, 8.sp, 4.sp),
                child: Row(
                  children: [
                    DefaultText.Overflow(
                        text: widget.category,
                        textcolor: colors.SecondaryTextColor,
                        size: 10.sp),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.SecondaryTextColor)),
                      child: DefaultText.Overflow(
                          text: ((widget.recipe.Calories! /
                                          widget.recipe.Weight!) *
                                      100)
                                  .floor()
                                  .toString() +
                              'Kcal',
                          textcolor: colors.SecondaryTextColor,
                          size: 9.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

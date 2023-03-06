import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

class RecipesItem extends StatefulWidget {
  const RecipesItem(
      {super.key,
      required this.RecipeName,
      required this.Ingredients,
      required this.Calories,
      required this.RecipeImage,
      required this.DietLabel});
  final String RecipeImage;
  final String RecipeName;
  final String DietLabel;
  final List<dynamic> Ingredients;
  final double Calories;

  @override
  State<RecipesItem> createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp),
      child: InkWell(
        onTap: (() {}),
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
                      widget.RecipeImage,
                      height: 80.sp,
                      width: 125.sp,
                      fit: BoxFit.fitWidth,
                    ),
                    // Container(
                    //   constraints: BoxConstraints(minHeight: 50, minWidth: 160),
                    //   decoration: BoxDecoration(
                    //       color: Color.fromARGB(150, 215, 204, 204),
                    //       borderRadius: BorderRadius.circular(22)),
                    //   child: DefaultText.SemiBold(
                    //       text: widget.RecipeName,
                    //       textcolor: Colors.white,
                    //       size: 16.sp),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.sp),
                child: DefaultText.Overflow(
                    text: widget.RecipeName,
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.sp, 0, 8.sp, 4.sp),
                child: Row(
                  children: [
                    DefaultText.Overflow(
                        text: widget.DietLabel,
                        textcolor: colors.SecondaryTextColor,
                        size: 10.sp),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.SecondaryTextColor)),
                      child: DefaultText.Overflow(
                          text: widget.Calories.floor().toString() + 'Kcal',
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

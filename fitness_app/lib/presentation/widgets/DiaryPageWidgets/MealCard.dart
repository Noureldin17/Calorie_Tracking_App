import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/FoodEntryItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

import '../DefaultText.dart';

class MealCard extends StatefulWidget {
  const MealCard(
      {super.key,
      required this.ImageAsset,
      required this.MealItems,
      required this.MealTitle,
      required this.OnAddFood});
  final Function OnAddFood;
  final String MealTitle;
  final String ImageAsset;
  final List<Map> MealItems;
  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10.sp, 0, 0),
      child: Padding(
        padding: EdgeInsets.only(left: 16.sp, right: 16.sp),
        child: Container(
          decoration: BoxDecoration(
              // color: Color.fromARGB(179, 206, 126, 46),
              color: Colors.white,
              borderRadius: BorderRadius.circular(22)),
          child: Column(
            children: [
              Container(
                width: 90.w,
                height: 95.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                    color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          color: Color.fromARGB(21, 210, 205, 205),
                        ),
                      ),
                      ClipPath(
                        clipper: WaveClipperOne(),
                        child: Container(
                          height: 80.sp,
                          color: Color.fromARGB(23, 241, 237, 237),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText.Bold(
                                      text: widget.MealTitle,
                                      textcolor: colors.PrimaryTextColor,
                                      size: 22.sp),
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.sp),
                                    child: DefaultText.SemiBold(
                                        text: 'Calories',
                                        textcolor: colors.PrimaryTextColor,
                                        size: 14.sp),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.sp),
                                    child: DefaultText.SemiBold(
                                        text: [
                                              ...widget.MealItems.map(
                                                  (element) {
                                                return element["Calories"];
                                              })
                                            ].fold(0, (previousValue, element) {
                                              num x = element;
                                              return previousValue + x.round();
                                            }).toString() +
                                            ' Kcal',
                                        textcolor: colors.SecondaryTextColor,
                                        size: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: Image.asset(
                                    widget.ImageAsset,
                                    fit: BoxFit.scaleDown,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              ...widget.MealItems.map((element) {
                return FoodEntryItem(
                    MealName: element["Item_Name"],
                    calories: element["Calories"]);
              }),
              Padding(
                padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 25.sp),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: colors.PrimaryTextColor),
                              borderRadius: BorderRadius.circular(22)),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        switch (widget.MealTitle) {
                          case "Breakfast":
                            widget.OnAddFood(1);
                            break;
                          case "Lunch":
                            widget.OnAddFood(2);
                            break;
                          case "Dinner":
                            widget.OnAddFood(3);
                            break;
                          default:
                            break;
                        }
                      },
                      child: DefaultText.Bold(
                          text: 'Add Food',
                          // textcolor: Colors.white,
                          textcolor: colors.PrimaryTextColor,
                          size: 12.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

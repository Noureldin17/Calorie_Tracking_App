import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

import '../DefaultText.dart';

class RecipeModalSheet extends StatefulWidget {
  const RecipeModalSheet({
    super.key,
    required this.controller,
    required this.CaloriesPerServing,
    required this.CarbsPerServing,
    required this.FatsPerServing,
    required this.ProteinPerServing,
  });
  final TextEditingController controller;
  final double CaloriesPerServing;
  final double CarbsPerServing;
  final double ProteinPerServing;
  final double FatsPerServing;
  @override
  State<RecipeModalSheet> createState() => _RecipeModalSheetState();
}

class _RecipeModalSheetState extends State<RecipeModalSheet> {
  late double Carbs;
  late double Calories;
  late double Protein;
  late double Fats;
  int index = 0;
  @override
  void initState() {
    Calories = widget.CaloriesPerServing;
    Carbs = widget.CarbsPerServing;
    Protein = widget.ProteinPerServing;
    Fats = widget.FatsPerServing;
    super.initState();
  }

  void CalculateMacros() {
    setState(() {
      Calories = ((widget.CaloriesPerServing / 100) *
          double.parse(widget.controller.text));
      Carbs = ((widget.CarbsPerServing / 100) *
          double.parse(widget.controller.text));
      Protein = ((widget.ProteinPerServing / 100) *
          double.parse(widget.controller.text));
      Fats = ((widget.FatsPerServing / 100) *
          double.parse(widget.controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      height: 330.sp,
      width: 300.sp,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(18.sp),
          child: DefaultText.Bold(
              text: 'Add Recipe',
              textcolor: colors.PrimaryTextColor,
              size: 16.sp),
        ),
        IntrinsicHeight(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 10.sp, start: 10.sp, end: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    DefaultText.Bold(
                        text: 'Calories',
                        textcolor: colors.PrimaryTextColor,
                        size: 12.sp),
                    DefaultText.Bold(
                        text: Calories.floor().toString() + ' Kcal',
                        textcolor: colors.SecondaryTextColor,
                        size: 12.sp),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Column(
                  children: [
                    DefaultText.Bold(
                        text: 'Protein',
                        textcolor: colors.PrimaryTextColor,
                        size: 12.sp),
                    DefaultText.Bold(
                        text: Protein.floor().toString() + ' g',
                        textcolor: colors.SecondaryTextColor,
                        size: 12.sp),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Column(
                  children: [
                    DefaultText.Bold(
                        text: 'Carbs',
                        textcolor: colors.PrimaryTextColor,
                        size: 12.sp),
                    DefaultText.Bold(
                        text: Carbs.floor().toString() + ' g',
                        textcolor: colors.SecondaryTextColor,
                        size: 12.sp),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Column(
                  children: [
                    DefaultText.Bold(
                        text: 'Fats',
                        textcolor: colors.PrimaryTextColor,
                        size: 12.sp),
                    DefaultText.Bold(
                        text: Fats.floor().toString() + ' g',
                        textcolor: colors.SecondaryTextColor,
                        size: 12.sp),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.sp, left: 20.sp, right: 10.sp),
              child: Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: colors.PrimaryColor)),
                child: DefaultText.Bold(
                    text: 'Enter amount (in grams)',
                    textcolor: colors.PrimaryColor,
                    size: 14.sp),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.sp, 20.sp, 20.sp, 0),
              child: Container(
                width: 60.sp,
                child: TextFormField(
                  onChanged: (_) {
                    CalculateMacros();
                  },
                  controller: widget.controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.PrimaryTextColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.PrimaryTextColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(10.sp)),
        Divider(color: Colors.black, indent: 40.sp, endIndent: 40.sp),
        Padding(padding: EdgeInsets.all(4.sp)),
        DefaultText.Bold(
            text: 'Add to', textcolor: colors.PrimaryTextColor, size: 16.sp),
        Padding(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80.sp,
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                          color: index == 0
                              ? colors.PrimaryColor
                              : colors.PrimaryTextColor)),
                  child: DefaultText.Bold(
                      text: 'Breakfast',
                      textcolor: index == 0
                          ? colors.PrimaryColor
                          : colors.PrimaryTextColor,
                      size: 14.sp),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80.sp,
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                          color: index == 1
                              ? colors.PrimaryColor
                              : colors.PrimaryTextColor)),
                  child: DefaultText.Bold(
                      text: 'Lunch',
                      textcolor: index == 1
                          ? colors.PrimaryColor
                          : colors.PrimaryTextColor,
                      size: 14.sp),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80.sp,
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                          color: index == 2
                              ? colors.PrimaryColor
                              : colors.PrimaryTextColor)),
                  child: DefaultText.Bold(
                      text: 'Dinner',
                      textcolor: index == 2
                          ? colors.PrimaryColor
                          : colors.PrimaryTextColor,
                      size: 14.sp),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: DefaultText.Bold(
                  text: 'Cancel',
                  textcolor: colors.PrimaryTextColor,
                  size: 10.sp),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: colors.PrimaryTextColor, width: 1.3),
                fixedSize: Size(45.w, 5.4.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: DefaultText.Bold(
                  text: 'Save', textcolor: Colors.white, size: 10.sp),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(45.w, 5.4.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: colors.ButtonColor,
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(4.sp)),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;
import '../DefaultText.dart';
import '../PrimaryButton.dart';

class SaveMealModalSheet extends StatefulWidget {
  const SaveMealModalSheet(
      {super.key, required this.OnSavePressed, required this.ItemsList});
  final Function OnSavePressed;
  final List<String> ItemsList;
  @override
  State<SaveMealModalSheet> createState() => _SaveMealModalSheetState();
}

class _SaveMealModalSheetState extends State<SaveMealModalSheet> {
  bool mealSelected = false;
  bool breakfastSelected = false;
  bool lunchSelected = false;
  bool dinnerSelected = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Align(
              alignment: Alignment.topCenter,
              child: DefaultText.Bold(
                  text: "Add items to meal",
                  textcolor: colors.PrimaryTextColor,
                  size: 18.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.sp, right: 20.sp, bottom: 8.sp, top: 16.sp),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  breakfastSelected = !breakfastSelected;
                  index = 1;
                  mealSelected =
                      breakfastSelected | lunchSelected | dinnerSelected;
                });
              },
              child: Container(
                width: 100.w,
                height: 30.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 1 ? colors.PrimaryColor : Colors.grey),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: DefaultText.Medium(
                    text: "Breakfast",
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 8.sp),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  lunchSelected = !lunchSelected;
                  index = 2;
                  mealSelected =
                      breakfastSelected | lunchSelected | dinnerSelected;
                });
              },
              child: Container(
                width: 100.w,
                height: 30.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 2 ? colors.PrimaryColor : Colors.grey),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: DefaultText.Medium(
                    text: "Lunch",
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 8.sp),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dinnerSelected = !dinnerSelected;
                  index = 3;
                  mealSelected =
                      breakfastSelected | lunchSelected | dinnerSelected;
                });
              },
              child: Container(
                width: 100.w,
                height: 30.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 3 ? colors.PrimaryColor : Colors.grey),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: DefaultText.Medium(
                    text: "Dinner",
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20.sp),
            child: PrimaryButton(
                buttonText: mealSelected ? "Save" : "Discard",
                OnPressed: () {
                  Navigator.pop(context);
                  widget.OnSavePressed(widget.ItemsList, index);
                }),
          )
        ],
      ),
    );
  }
}

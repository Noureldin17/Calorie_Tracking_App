import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;
import '../../../constants/detection_constants.dart' as constants;

class DetectionInfoView extends StatefulWidget {
  const DetectionInfoView({
    super.key,
    required this.Icon_Image,
    required this.Detection_Name,
    required this.Estimated_Weight,
    required this.Estimated_Calories,
    required this.OnChangeWeight,
    required this.ItemIndex,
  });
  final Image Icon_Image;
  final String Detection_Name;
  final num Estimated_Weight;
  final num Estimated_Calories;
  final Function OnChangeWeight;
  final int ItemIndex;
  @override
  State<DetectionInfoView> createState() => _DetectionInfoViewState();
}

class _DetectionInfoViewState extends State<DetectionInfoView> {
  TextEditingController controller = new TextEditingController();
  bool WeightChanged = false;
  bool CaloriesChanged = false;
  num Weight = -1;
  num Calories = -1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14.sp, 4.sp, 14.sp, 2.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText.Bold(
                          text: "Food: " + widget.Detection_Name,
                          textcolor: colors.PrimaryTextColor,
                          size: 14.sp),
                      Padding(padding: EdgeInsets.all(2.sp)),
                      DefaultText.SemiBold(
                          text: "Calories/100g: " +
                              "${constants.MacrosPerServing[constants.classes.indexOf(widget.Detection_Name)]["calories"]} kcal",
                          textcolor: colors.SecondaryTextColor,
                          size: 10.sp),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 45.sp,
                      width: 45.sp,
                      child: widget.Icon_Image,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(4.sp)),
              Divider(
                height: 3,
                thickness: 1,
              ),
              Padding(padding: EdgeInsets.all(4.sp)),
              DefaultText.Bold(
                  text: "Estimated Weight: ${widget.Estimated_Weight.round()}g",
                  textcolor: colors.PrimaryTextColor,
                  size: 14.sp),
              Padding(padding: EdgeInsets.all(2.sp)),
              DefaultText.SemiBold(
                  text:
                      "Estimated Calories: ${widget.Estimated_Calories.round()} kcal",
                  textcolor: colors.SecondaryTextColor,
                  size: 10.sp),
              Padding(padding: EdgeInsets.all(4.sp)),
              Divider(
                height: 3,
                thickness: 1,
              ),
              Padding(padding: EdgeInsets.all(4.sp)),
              DefaultText.Bold(
                  text: !WeightChanged
                      ? "Applied Weight: ${widget.Estimated_Weight.round()}g"
                      : "Applied Weight: ${Weight}g",
                  textcolor: colors.PrimaryTextColor,
                  size: 14.sp),
              Padding(padding: EdgeInsets.all(2.sp)),
              DefaultText.SemiBold(
                  text: !CaloriesChanged
                      ? "Applied Calories: ${widget.Estimated_Calories.round()} kcal"
                      : "Applied Calories: ${Calories.round()} kcal",
                  textcolor: colors.SecondaryTextColor,
                  size: 10.sp),
              Padding(padding: EdgeInsets.all(4.sp)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    print(widget.ItemIndex);
                    WeightChanged = true;
                    CaloriesChanged = true;
                    if (value.isEmpty) {
                      Weight = 0;
                      Calories = 0;
                    } else {
                      Weight = num.parse(value);
                      Calories = (constants.MacrosPerServing[constants.classes
                                  .indexOf(widget.Detection_Name)]["calories"] *
                              Weight) /
                          100;
                    }
                    widget.OnChangeWeight(Weight, Calories, widget.ItemIndex);
                  });
                },
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colors.PrimaryTextColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colors.PrimaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(2.sp)),
              DefaultText.SemiBold(
                  text:
                      " hint: change the applied weight using the above textbox!",
                  textcolor: colors.SecondaryTextColor,
                  size: 8.sp),
            ],
          ),
        ),
      ),
    );
  }
}

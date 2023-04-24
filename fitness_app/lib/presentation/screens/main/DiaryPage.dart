import 'package:camera/camera.dart';
import 'package:fitness_app/presentation/screens/CameraPage.dart';
import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/CalorieMetricsCard.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/FoodEntryItem.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/MealCard.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/SaveFoodModalSheet.dart';
import 'package:fitness_app/presentation/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  static const platform = const MethodChannel("food.detection/java");
  List<String> JavaResults = [];
  List<String> BreakFastItems = [];
  List<String> LunchItems = [];
  List<String> DinnerItems = [];

  void OpenCamera() async {
    await availableCameras().then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => CameraPage(cameras: value))));
    });
  }

  void AddItemToMeal(List<String> Items, int Meal) {
    switch (Meal) {
      case 1:
        setState(() {
          BreakFastItems += Items;
        });
        break;
      case 2:
        setState(() {
          LunchItems += Items;
        });
        break;
      case 3:
        setState(() {
          DinnerItems += Items;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 60.sp, right: 10.sp),
            child: FloatingActionButton(
              child: SvgPicture.asset(
                'assets/icons/camera.svg',
                color: Colors.white,
              ),
              backgroundColor: colors.PrimaryColor,
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomeView()));

                runJava().then((value) {
                  setState(() {
                    JavaResults += value;
                  });
                  if (!JavaResults.isEmpty) {
                    showModalBottomSheet(
                      isDismissible: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.sp),
                              topRight: Radius.circular(12.sp))),
                      context: context,
                      builder: (context) {
                        return SaveMealModalSheet(
                          OnSavePressed: AddItemToMeal,
                          ItemsList: JavaResults,
                        );
                      },
                    );
                  }
                });
              },
            ),
          ),
          backgroundColor: colors.BackgroundColor,
          body: Stack(
            children: [
              Column(
                children: [
                  // CalendarTimeline(
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime(2000),
                  //     lastDate: DateTime(3000),
                  //     onDateSelected: ((p0) {})),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 205.sp,
                          ),
                          MealCard(
                              ImageAsset: 'assets/egg.png',
                              MealTitle: 'Breakfast',
                              FoodItems: BreakFastItems,
                              TotalCalories: 423),
                          MealCard(
                              ImageAsset: 'assets/Beef.png',
                              MealTitle: 'Lunch',
                              FoodItems: LunchItems,
                              TotalCalories: 375),
                          MealCard(
                              ImageAsset: 'assets/salad.png',
                              MealTitle: 'Dinner',
                              FoodItems: DinnerItems,
                              TotalCalories: 623),
                          SizedBox(
                            height: 70.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CalorieMetricsCard(),
            ],
          )),
    );
  }

  Future<List<String>> runJava() async {
    setState(() {
      JavaResults = [];
    });
    List<String>? Value = await platform.invokeListMethod('start');
    return Value as List<String>;
  }
}

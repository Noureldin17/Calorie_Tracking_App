import 'package:camera/camera.dart';
import 'package:fitness_app/presentation/screens/CameraPage.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/CalorieMetricsCard.dart';
import 'package:fitness_app/presentation/widgets/DiaryPageWidgets/MealCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  void OpenCamera() async {
    await availableCameras().then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => CameraPage(cameras: value))));
    });
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
                OpenCamera();
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
                              TotalCalories: 423),
                          MealCard(
                              ImageAsset: 'assets/Beef.png',
                              MealTitle: 'Lunch',
                              TotalCalories: 375),
                          MealCard(
                              ImageAsset: 'assets/salad.png',
                              MealTitle: 'Dinner',
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
}

import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeCalorieMetrics.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomePageDiaryCard.dart';
import 'package:fitness_app/presentation/widgets/HomePageWidgets/HomeProfileBanner.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => SafeArea(
        child: Scaffold(
          backgroundColor: colors.BackgroundColor,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                HomeProfileBanner(),
                Container(
                  alignment: Alignment.topCenter,
                  height: orientation == Orientation.portrait ? 80.h : 70.w,
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      return GridView.count(
                        childAspectRatio: 1.6,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount:
                            orientation == Orientation.portrait ? 1 : 2,
                        children: [
                          HomeDiaryCard(),
                          HomeCalorieMetrics(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

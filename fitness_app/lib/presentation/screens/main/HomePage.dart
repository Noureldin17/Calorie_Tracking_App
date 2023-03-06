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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HomeProfileBanner(),
                    HomeDiaryCard(),
                    HomeCalorieMetrics(),
                  ],
                )))));
  }
}

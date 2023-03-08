import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;
import '../DefaultText.dart';

class HomeCalorieMetrics extends StatefulWidget {
  const HomeCalorieMetrics({super.key});

  @override
  State<HomeCalorieMetrics> createState() => _HomeCalorieMetricsState();
}

class _HomeCalorieMetricsState extends State<HomeCalorieMetrics> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14.sp, left: 16.sp, right: 16.sp),
          child: Container(
            width: 110.sp,
            height: 140.sp,
            decoration: BoxDecoration(
                color: Color(0xFFFDEEDC),
                borderRadius: BorderRadius.circular(22)),
            child: LiquidLinearProgressIndicator(
              borderColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Color(0xFFFFC090)),
              borderWidth: 0,
              borderRadius: 22,
              backgroundColor: Color(0xFFFDEEDC),
              direction: Axis.vertical,
              value: 0.7,
              center: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.sp),
                    child: Container(
                      width: 45.sp,
                      height: 45.sp,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(166, 255, 223, 175),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                          child: Text(
                        '🔥',
                        style: TextStyle(fontSize: 22.sp),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.sp),
                    child: DefaultText.Bold(
                        text: '2,000',
                        textcolor: colors.PrimaryTextColor,
                        size: 28.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.sp),
                    child: DefaultText.Medium(
                        text: 'Kcal Eaten',
                        textcolor: colors.SecondaryTextColor,
                        size: 16.sp),
                  )
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.sp, top: 16.sp),
              child: Container(
                width: 140.sp,
                height: 37.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFFFDEDE)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Container(
                        padding: EdgeInsets.all(4.sp),
                        width: 25.sp,
                        height: 25.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFFFFC3C3)),
                        child: Image.asset(
                          'assets/icons/meat.png',
                          color: Color(0xFFF55050),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.sp),
                      child: DefaultText.Bold(
                          text: '70g proteins',
                          textcolor: colors.PrimaryTextColor,
                          size: 12.sp),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.sp),
              child: Container(
                width: 140.sp,
                height: 37.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFE1EEDD)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Container(
                        padding: EdgeInsets.all(4.sp),
                        width: 25.sp,
                        height: 25.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFFC7E8CA)),
                        child: Image.asset(
                          'assets/icons/bread.png',
                          color: Color(0xFF609966),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.sp),
                      child: DefaultText.Bold(
                          text: '120g carbs',
                          textcolor: colors.PrimaryTextColor,
                          size: 12.sp),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 140.sp,
              height: 37.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFE3DFFD)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Container(
                      padding: EdgeInsets.all(6.sp),
                      width: 25.sp,
                      height: 25.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(190, 191, 172, 226)),
                      child: Image.asset(
                        'assets/icons/fat.png',
                        color: Color(0xFFA084DC),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.sp),
                    child: DefaultText.Bold(
                        text: '21g fats',
                        textcolor: colors.PrimaryTextColor,
                        size: 12.sp),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

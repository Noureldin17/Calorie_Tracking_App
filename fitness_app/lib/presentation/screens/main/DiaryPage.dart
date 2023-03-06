import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.BackgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 230.sp,
                      width: 100.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [colors.PrimaryColor, Color(0xFF5F9DF7)]),
                      ),
                    )),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.sp, left: 20.sp),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 40.sp, horizontal: 10.sp),
                        height: 160.sp,
                        width: 130.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Color.fromARGB(255, 235, 241, 255)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinearPercentIndicator(
                              barRadius: Radius.circular(12),
                              percent: 0.7,
                              animation: true,
                              lineHeight: 10,
                              width: 100.sp,
                            ),
                            LinearPercentIndicator(
                              barRadius: Radius.circular(12),
                              percent: 0.7,
                              animation: true,
                              lineHeight: 10,
                              width: 100.sp,
                            ),
                            LinearPercentIndicator(
                              barRadius: Radius.circular(12),
                              percent: 0.7,
                              animation: true,
                              lineHeight: 10,
                              width: 100.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 40.sp, right: 20.sp),
                      child: CircularPercentIndicator(
                        center: DefaultText.SemiBold(
                            text: '2000 Kcal',
                            textcolor: Colors.white,
                            size: 16.sp),
                        restartAnimation: true,
                        animation: true,
                        arcType: ArcType.FULL,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 16,
                        percent: 0.5,
                        radius: 60.sp,
                        progressColor: Colors.white,
                        arcBackgroundColor: Color.fromARGB(52, 255, 255, 255),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

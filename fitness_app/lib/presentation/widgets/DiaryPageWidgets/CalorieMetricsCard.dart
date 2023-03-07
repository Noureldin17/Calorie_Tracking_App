import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../DefaultText.dart';

class CalorieMetricsCard extends StatefulWidget {
  const CalorieMetricsCard({super.key});

  @override
  State<CalorieMetricsCard> createState() => _CalorieMetricsCardState();
}

class _CalorieMetricsCardState extends State<CalorieMetricsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.sp, 20.sp, 16.sp, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 205.sp,
          width: 100.w,
          decoration: BoxDecoration(
              color: colors.CardBackgroundColor,
              borderRadius: BorderRadius.circular(22)),
          child: Stack(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 140.sp,
                  color: Color.fromARGB(29, 64, 124, 255),
                ),
              ),
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  height: 160.sp,
                  color: Color.fromARGB(20, 64, 124, 255),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 14.sp),
                          child: Column(
                            children: [
                              DefaultText.Bold(
                                  text: '1456 kcal',
                                  textcolor: colors.PrimaryTextColor,
                                  size: 14.sp),
                              DefaultText.SemiBold(
                                  text: 'Total Calories',
                                  textcolor: colors.SecondaryTextColor,
                                  size: 12.sp),
                            ],
                          ),
                        ),
                        CircularPercentIndicator(
                            animation: true,
                            radius: 90.sp,
                            backgroundWidth: 16,
                            lineWidth: 12,
                            circularStrokeCap: CircularStrokeCap.round,
                            // backgroundColor: Color.fromARGB(255, 229, 231, 235),
                            backgroundColor: Color(0xFF95BDFF),
                            // progressColor: Color(0xFFE14D2A),
                            // progressColor: Color.fromARGB(255, 20, 98, 135),
                            progressColor: colors.PrimaryColor,
                            // progressColor: colors.PrimaryColor,
                            percent: 0.5,
                            center: DottedBorder(
                              // color: Color(0xFFE14D2A),
                              color: Color.fromARGB(255, 20, 98, 135),
                              strokeWidth: 3,
                              dashPattern: [1, 12],
                              padding: EdgeInsets.all(16.sp),
                              borderType: BorderType.Circle,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "2000",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: colors.PrimaryTextColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700))),
                                    TextSpan(
                                        text: '\nKcal',
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color:
                                                    colors.SecondaryTextColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500))),
                                  ])),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 14.sp),
                          child: Column(
                            children: [
                              DefaultText.Bold(
                                  text: '544 kcal',
                                  textcolor: colors.PrimaryTextColor,
                                  size: 14.sp),
                              DefaultText.SemiBold(
                                  text: 'Calories Left',
                                  textcolor: colors.SecondaryTextColor,
                                  size: 12.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.sp, 12.sp, 12.sp, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.sp),
                                width: 35.sp,
                                height: 35.sp,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    color: Color(0xFFF7A4A4),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.asset(
                                  'assets/icons/meat.png',
                                  color: Color(0xFFDD5353),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 4.sp, bottom: 6.sp),
                                child: DefaultText.Bold(
                                    text: 'Protein',
                                    textcolor: colors.PrimaryTextColor,
                                    size: 10.sp),
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.sp,
                                width: 60.sp,
                                animation: true,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                percent: 0.7,
                                progressColor: Color(0xFFDD5353),
                                backgroundColor: Color(0xFFF7A4A4),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.sp),
                                child: DefaultText.SemiBold(
                                    text: '12g left',
                                    textcolor: colors.SecondaryTextColor,
                                    size: 10.sp),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.sp),
                                width: 35.sp,
                                height: 35.sp,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    // color: Color(0xFF9ED5C5),
                                    color: Color(0xFFF4E185),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.asset(
                                  'assets/icons/bread.png',
                                  // color: Color(0xFF68B984),
                                  color: Color(0XFFE7B10A),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 4.sp, bottom: 6.sp),
                                child: DefaultText.Bold(
                                    text: 'Carbs',
                                    textcolor: colors.PrimaryTextColor,
                                    size: 10.sp),
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.sp,
                                width: 60.sp,
                                animation: true,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                percent: 0.7,
                                // progressColor: Color(0xFF68B984),
                                progressColor: Color(0XFFE7B10A),
                                backgroundColor: Color(0xFFF4E185),
                                // backgroundColor: Color(0xFF9ED5C5),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.sp),
                                child: DefaultText.SemiBold(
                                    text: '12g left',
                                    textcolor: colors.SecondaryTextColor,
                                    size: 10.sp),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.sp),
                                width: 35.sp,
                                height: 35.sp,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    color: Color(0xFF95BDFF),
                                    // color: Color(0xFFF4E185),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.asset(
                                  'assets/icons/fat.png',
                                  // color: Color(0XFFE7B10A),
                                  color: colors.PrimaryColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 4.sp, bottom: 6.sp),
                                child: DefaultText.Bold(
                                    text: 'Fat',
                                    textcolor: colors.PrimaryTextColor,
                                    size: 10.sp),
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.sp,
                                width: 60.sp,
                                animation: true,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                percent: 0.7,
                                // progressColor: Color(0XFFE7B10A),
                                progressColor: colors.PrimaryColor,
                                // backgroundColor: Color(0xFFF4E185),
                                backgroundColor: Color(0xFF95BDFF),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.sp),
                                child: DefaultText.SemiBold(
                                    text: '12g left',
                                    textcolor: colors.SecondaryTextColor,
                                    size: 10.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

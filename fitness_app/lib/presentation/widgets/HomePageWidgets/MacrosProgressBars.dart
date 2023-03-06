import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;

class MacrosProgressBar extends StatefulWidget {
  const MacrosProgressBar({super.key});

  @override
  State<MacrosProgressBar> createState() => _MacrosProgressBarState();
}

class _MacrosProgressBarState extends State<MacrosProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22.sp, horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: SizedBox(
                            height: 100,
                            width: 90,
                            child: RotatedBox(
                                quarterTurns: -1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: 0.7,
                                    backgroundColor: Color(0xFFDFEEEA),
                                    valueColor: AlwaysStoppedAnimation(
                                        Color(0xFFBEDBBB)),
                                  ),
                                )),
                          ),
                        ),
                        DefaultText.Bold(
                            text: '70%',
                            textcolor: colors.PrimaryTextColor,
                            size: 16.sp)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp),
                      child: DefaultText.Bold(
                          text: 'Proteins',
                          textcolor: colors.PrimaryTextColor,
                          size: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.sp),
                      child: DefaultText.SemiBold(
                          text: '32g',
                          textcolor: colors.SecondaryTextColor,
                          size: 14.sp),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: SizedBox(
                        height: 100,
                        width: 90,
                        child: RotatedBox(
                            quarterTurns: -1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                backgroundColor: Color(0xFFFCECDD),
                                valueColor:
                                    AlwaysStoppedAnimation(Color(0xFFFFC288)),
                                color: colors.ButtonColor,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp),
                      child: DefaultText.Bold(
                          text: 'Carbs',
                          textcolor: colors.PrimaryTextColor,
                          size: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.sp),
                      child: DefaultText.SemiBold(
                          text: '32g',
                          textcolor: colors.SecondaryTextColor,
                          size: 14.sp),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: SizedBox(
                        height: 100,
                        width: 90,
                        child: RotatedBox(
                            quarterTurns: -1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                backgroundColor: Color(0xFFECF2FF),
                                valueColor:
                                    AlwaysStoppedAnimation(Color(0xFFABC9FF)),
                                color: colors.ButtonColor,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp),
                      child: DefaultText.Bold(
                          text: 'Fats',
                          textcolor: colors.PrimaryTextColor,
                          size: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.sp),
                      child: DefaultText.SemiBold(
                          text: '32g',
                          textcolor: colors.SecondaryTextColor,
                          size: 14.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

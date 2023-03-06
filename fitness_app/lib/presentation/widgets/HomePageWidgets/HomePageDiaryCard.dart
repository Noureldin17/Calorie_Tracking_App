import 'package:fitness_app/presentation/screens/AppMainPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;
import '../DefaultText.dart';

class HomeDiaryCard extends StatelessWidget {
  const HomeDiaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.sp, 10.sp, 16.sp, 0),
          child: Container(
            padding: EdgeInsets.all(10.sp),
            height: 155.sp,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.sp),
                color: colors.CardBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText.Medium(
                    text: 'Having another \nmeal ?',
                    textcolor: colors.PrimaryTextColor,
                    size: 18.sp),
                Padding(
                  padding: EdgeInsets.only(top: 8.sp),
                  child: DefaultText.Medium(
                      text: 'Log your meal directly \nto diary',
                      textcolor: colors.SecondaryTextColor,
                      size: 12.sp),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.sp, left: 4.sp),
                  child: ElevatedButton(
                    onPressed: () {
                      streamController.add(1);
                    },
                    child: DefaultText.Medium(
                        text: 'Go to diary',
                        textcolor: Colors.white,
                        size: 10.sp),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(30.w, 4.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.sp)),
                      backgroundColor: colors.ButtonColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.7.sp, -0.7.sp),
          child: Image.asset(
            'assets/illustrations/Healthy options-amico.png',
            height: 120.sp,
            width: 120.sp,
          ),
        )
      ],
    );
  }
}

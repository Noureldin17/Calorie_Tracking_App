import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

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
            height: 145.sp,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: colors.CardBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText.Medium(
                    text: 'Having another \nmeal ?',
                    textcolor: colors.PrimaryTextColor,
                    size: 24),
                Padding(
                  padding: EdgeInsets.only(top: 8.sp),
                  child: DefaultText.Medium(
                      text: 'Log your meal directly \nto diary',
                      textcolor: colors.SecondaryTextColor,
                      size: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.sp, left: 8.sp),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: DefaultText.Medium(
                        text: 'Go to diary', textcolor: Colors.white, size: 14),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(30.w, 4.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: colors.ButtonColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/illustrations/Healthy options-amico.png',
            height: 190,
            width: 190,
          ),
        )
      ],
    );
  }
}
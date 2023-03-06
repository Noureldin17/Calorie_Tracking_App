import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;
import '../DefaultText.dart';

class HomeProfileBanner extends StatelessWidget {
  const HomeProfileBanner({super.key});
  @override
  Widget build(BuildContext context) {
    final DateTime dateFormat = DateTime.now();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
      child: Container(
        padding: EdgeInsets.only(
            bottom: 10.sp, left: 16.sp, right: 16.sp, top: 10.sp),
        height: 70.sp,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.circular(22),
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(26),
            //     bottomRight: Radius.circular(26)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText.Bold(
                        text: 'Hey, Mohamed !',
                        // textcolor: Color.fromARGB(255, 77, 79, 100),
                        textcolor: colors.PrimaryTextColor,
                        size: 18.sp),
                    Padding(
                      padding: EdgeInsets.only(top: 6.sp),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            DefaultText.SemiBold(
                                text: DateFormat.EEEE().format(dateFormat),
                                // textcolor: Color.fromARGB(255, 77, 79, 100),
                                textcolor: colors.SecondaryTextColor,
                                size: 10.sp),
                            VerticalDivider(
                              thickness: 1,
                              // color: Color.fromARGB(255, 77, 79, 100),
                              color: colors.SecondaryTextColor,
                            ),
                            DefaultText.SemiBold(
                                text: Jiffy(dateFormat).format("do") + ' ',
                                // textcolor: Color.fromARGB(255, 77, 79, 100),
                                textcolor: colors.SecondaryTextColor,
                                size: 10.sp),
                            DefaultText.SemiBold(
                                text: DateFormat.yMMM().format(dateFormat),
                                // textcolor: Color.fromARGB(255, 77, 79, 100),
                                textcolor: colors.SecondaryTextColor,
                                size: 10.sp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  maxRadius: 28,
                  backgroundImage: AssetImage('assets/ProfilePic.png'),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(20.sp, 6.sp, 20.sp, 0.sp),
            //   child: Divider(
            //     thickness: 1,
            //     color: Color.fromARGB(90, 158, 158, 158),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 2.sp),
            //   child: DefaultText.SemiBold(
            //       text: 'Keep up the good work! 💪',
            //       textcolor: colors.SecondaryTextColor,
            //       size: 18),
            // ),
          ],
        ),
      ),
    );
  }
}

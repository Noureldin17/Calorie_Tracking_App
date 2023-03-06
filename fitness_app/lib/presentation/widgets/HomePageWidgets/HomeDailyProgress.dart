import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// import '../../colors.dart' as colors;

class HomeDailyProgress extends StatefulWidget {
  const HomeDailyProgress({super.key});

  @override
  State<HomeDailyProgress> createState() => _HomeDailyProgressState();
}

class _HomeDailyProgressState extends State<HomeDailyProgress> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: Container(
            height: 130.sp,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                // gradient: LinearGradient(colors: [
                //   // colors.PrimaryColor,
                //   Color(0xFFA084DC),
                //   Color(0xFFE5D1FA)
                //   // colors.CardBackgroundColor,
                // ]),
                color: Color(0xFFA084DC)),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            right: 16.sp,
          ),
          child: Container(
            height: 130.sp,
            width: 45.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colors.white),
          ),
        ),
      ],
    );
  }
}

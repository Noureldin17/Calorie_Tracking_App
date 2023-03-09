import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import 'package:sizer/sizer.dart';

import '../DefaultText.dart';
import '../PrimaryButton.dart';

class CameraLoadingCard extends StatelessWidget {
  const CameraLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: colors.CardBackgroundColor),
          height: 280.sp,
          width: 100.w,
          child: Column(
            children: [
              Image.asset(
                'assets/illustrations/Camera-pana.png',
                width: 150.sp,
                height: 150.sp,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.sp, bottom: 18.sp),
                child: DefaultText.Bold(
                    text: 'Opening Camera Please Wait...',
                    textcolor: colors.PrimaryTextColor,
                    size: 16.sp),
              ),
              Center(
                child: CircularProgressIndicator(
                  color: colors.PrimaryTextColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 8.sp, right: 8.sp, top: 8.sp, bottom: 8.sp),
                child: PrimaryButton(
                    buttonText: 'Cancel',
                    OnPressed: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

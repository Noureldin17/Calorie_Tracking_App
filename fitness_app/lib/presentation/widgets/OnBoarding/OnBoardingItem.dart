import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/onboarding_model.dart';
import '../../colors.dart' as colors;

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.model});
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Container(
        height: orientation == Orientation.portrait ? 80.h : 69.w,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              children: [
                Padding(
                  padding: orientation == Orientation.portrait
                      ? EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)
                      : EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20.w),
                  child: Image.asset(
                    model.image,
                    fit: orientation == Orientation.portrait
                        ? BoxFit.fitHeight
                        : BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 18.sp, right: 18.sp, bottom: 18.h),
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(18.sp),
                      color: colors.CardBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        model.textContainer,
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          model.body,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

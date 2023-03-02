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
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Image.asset(
                      model.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
                    child: Container(
                      height: 165.sp,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.1, color: colors.ButtonColor),
                          borderRadius: BorderRadius.circular(9),
                          color: Color.fromARGB(206, 252, 248, 232)),
                      child: Column(
                        children: [
                          model.textContainer,
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            model.body,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

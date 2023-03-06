import 'package:flutter/material.dart';
import '../colors.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'DefaultText.dart';

class RecipeHeader extends StatelessWidget {
  const RecipeHeader(
      {super.key, required this.HeaderText, required this.OnViewMore});
  final Function OnViewMore;
  final String HeaderText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.sp, top: 10.sp, right: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText.Bold(
              text: HeaderText,
              textcolor: colors.SecondaryTextColor,
              size: 14.sp),
          GestureDetector(
            onTap: () {
              OnViewMore();
            },
            child: Row(
              children: [
                DefaultText.SemiBold(
                    text: 'View More',
                    textcolor: colors.SecondaryTextColor,
                    size: 12.sp),
                SvgPicture.asset(
                  'assets/icons/arrows/arrow-right_button.svg',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

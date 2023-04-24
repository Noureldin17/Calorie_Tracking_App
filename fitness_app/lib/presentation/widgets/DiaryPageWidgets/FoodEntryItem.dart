import 'package:flutter/material.dart';
import '../../colors.dart' as colors;
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../DefaultText.dart';

class FoodEntryItem extends StatefulWidget {
  const FoodEntryItem({super.key, required this.MealName});
  final String MealName;

  @override
  State<FoodEntryItem> createState() => _FoodEntryItemState();
}

class _FoodEntryItemState extends State<FoodEntryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 4.sp),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText.OneLineOverflow(
                    text: widget.MealName,
                    textcolor: colors.PrimaryTextColor,
                    size: 12.sp),
                Padding(padding: EdgeInsets.all(2.sp)),
                DefaultText.OneLineOverflow(
                    text: '320 Kcal',
                    textcolor: colors.SecondaryTextColor,
                    size: 10.sp),
              ],
            ),
            Spacer(),
            IconButton(
              constraints: BoxConstraints(maxHeight: 40.sp, maxWidth: 40.sp),
              splashRadius: 20.sp,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/arrows/arrow-right.svg',
                color: colors.PrimaryTextColor,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

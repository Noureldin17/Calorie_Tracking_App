import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart' as colors;

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.buttonText, required this.OnPressed});
  final String buttonText;
  final Function OnPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OnPressed();
      },
      child: DefaultText.Medium(
          text: buttonText, textcolor: Colors.white, size: 14),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(87.4.w, 5.92.h),
        backgroundColor: colors.ButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

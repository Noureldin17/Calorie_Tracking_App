import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  const DefaultText.Normal(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.size})
      : fontWeight = FontWeight.w400,
        MaxLines = 20;
  const DefaultText.Medium(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.size})
      : fontWeight = FontWeight.w500,
        MaxLines = 20;
  const DefaultText.SemiBold(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.size})
      : fontWeight = FontWeight.w600,
        MaxLines = 20;
  const DefaultText.Bold(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.size})
      : fontWeight = FontWeight.w700,
        MaxLines = 20;
  const DefaultText.Overflow(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.size})
      : fontWeight = FontWeight.w600,
        MaxLines = 2;

  final String text;
  final Color textcolor;
  final double size;
  final int MaxLines;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: MaxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        color: textcolor,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../presentation/colors.dart' as colors;
import '../data/models/onboarding_model.dart';

final List<OnBoardingModel> onboardinglist = [
  OnBoardingModel(
      image: 'assets/onboarding/Diet-amico.png',
      textContainer: Container(
          child: RichText(
              text: TextSpan(children: [
        TextSpan(
            text: "Easily log your meals to ",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 39),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500))),
        TextSpan(
            text: 'your diary ',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: colors.PrimaryColor,
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500))),
        TextSpan(
            text: "and track calories ",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 39),
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500)))
      ]))),
      body:
          'Advanced meal tracker and nutrition analyzer to help you stay on track and ensure results will last.'),
  OnBoardingModel(
      image: 'assets/onboarding/Diet-pana.png',
      textContainer: Container(
          child: RichText(
              text: TextSpan(children: [
        TextSpan(
            text: "Stick to your diet and stay healthy with ",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 39),
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500))),
        TextSpan(
            text: 'FOODPIC',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: colors.PrimaryColor,
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500))),
      ]))),
      body:
          'Start tracking your calories every meal using only your phone camera.'),
  OnBoardingModel(
      image: 'assets/onboarding/Diet-rafiki.png',
      textContainer: Container(
          child: RichText(
              text: TextSpan(children: [
        TextSpan(
            text: "Achieve your goals, ",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 39),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500))),
        TextSpan(
            text: 'get in shape, ',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: colors.PrimaryColor,
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500))),
        TextSpan(
            text: "enjoy a healthy lifestyle",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 39),
                    fontSize: 24.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500)))
      ]))),
      body:
          'Stop eating junk food and start looking for healthy replacements.'),
];

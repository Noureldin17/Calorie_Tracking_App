import 'package:fitness_app/presentation/widgets/DefaultText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart' as colors;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.BackgroundColor,
      body: Center(
          child: DefaultText.Medium(
              text: 'Diary Page', textcolor: Colors.black, size: 30.sp)),
    );
  }
}

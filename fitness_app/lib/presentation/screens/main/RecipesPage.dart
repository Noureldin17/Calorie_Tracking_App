import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;
import '../../widgets/DefaultText.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colors.BackgroundColor,
      body: Container(
          height: 300.sp,
          width: 100.w,
          child: DefaultText.Medium(
              text: 'Profile Page', textcolor: Colors.black, size: 30)),
    ));
  }
}

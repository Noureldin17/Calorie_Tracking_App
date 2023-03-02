import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/DefaultText.dart';
import '../../colors.dart' as colors;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => SafeArea(
            child: Scaffold(
                backgroundColor: colors.BackgroundColor,
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Container(
                        height: 100.sp,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Column(
                          children: [
                            DefaultText.SemiBold(
                                text: 'Hi, Mohamed',
                                textcolor: Color.fromARGB(255, 8, 13, 45),
                                size: 30)
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}

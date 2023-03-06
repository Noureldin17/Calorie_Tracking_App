import 'dart:async';

import 'package:fitness_app/presentation/screens/main/HomePage.dart';
import 'package:fitness_app/presentation/screens/main/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart' as colors;
import 'main/DiaryPage.dart';

StreamController<int> streamController = StreamController<int>();

// ignore: must_be_immutable
class AppMainPage extends StatefulWidget {
  AppMainPage(this.stream, {super.key});
  final Stream<int> stream;
  int currentIndex = 0;
  List<Widget> mainPages = [
    HomePage(),
    DiaryPage(),
    ProfilePage(),
  ];
  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(14.sp, 0, 14.sp, 14.sp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22.sp),
            child: Container(
              height: 55.sp,
              child: BottomNavigationBar(
                // backgroundColor: Color.fromARGB(208, 116, 66, 241),
                backgroundColor: colors.PrimaryColor,
                elevation: 0,
                enableFeedback: false,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                selectedFontSize: 12.sp,
                unselectedFontSize: 12.sp,
                selectedItemColor: Colors.white,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/homeactive.svg',
                          color: Colors.white,
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/home.svg',
                          color: Colors.white,
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/diaryactive.svg',
                          color: Colors.white,
                          height: 24.sp,
                          width: 24.sp,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/diary.svg',
                          height: 24.sp,
                          width: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Diary'),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/profileactive.svg',
                          height: 24.sp,
                          width: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/profile.svg',
                          color: Colors.white,
                          height: 24..sp,
                          width: 24..sp,
                        ),
                      ),
                      label: 'Profile'),
                ],
                showSelectedLabels: false,
                currentIndex: widget.currentIndex,
                onTap: switchPage,
              ),
            ),
          ),
        ),
        backgroundColor: colors.BackgroundColor,
        // backgroundColor: Colors.white,
        body: widget.mainPages.elementAt(widget.currentIndex));
  }

  void initState() {
    super.initState();
    widget.stream.listen((index) {
      switchPage(index);
    });
  }

  void switchPage(int value) {
    setState(() {
      widget.currentIndex = value;
    });
  }
}

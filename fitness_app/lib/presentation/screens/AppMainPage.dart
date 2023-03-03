import 'package:fitness_app/presentation/screens/main/HomePage.dart';
import 'package:fitness_app/presentation/screens/main/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart' as colors;
import 'main/DiaryPage.dart';

// ignore: must_be_immutable
class AppMainPage extends StatefulWidget {
  AppMainPage({super.key});
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
            borderRadius: BorderRadius.circular(22),
            child: Container(
              height: 50.sp,
              child: BottomNavigationBar(
                // backgroundColor: Color.fromARGB(208, 116, 66, 241),
                backgroundColor: colors.PrimaryColor,
                elevation: 0,
                enableFeedback: false,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                selectedFontSize: 12,
                unselectedFontSize: 12,
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
                          height: 24,
                          width: 24,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/home.svg',
                          color: Colors.white,
                          height: 24,
                          width: 24,
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
                          height: 24,
                          width: 24,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/diary.svg',
                          height: 24,
                          width: 24,
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
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                      ),
                      icon: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: SvgPicture.asset(
                          'assets/icons/navbar/profile.svg',
                          color: Colors.white,
                          height: 24,
                          width: 24,
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

  void switchPage(int value) {
    setState(() {
      widget.currentIndex = value;
    });
  }
}

import 'package:fitness_app/presentation/screens/main/HomePage.dart';
import 'package:fitness_app/presentation/screens/main/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color.fromARGB(255, 156, 163, 175),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: colors.PrimaryColor,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset(
                    'assets/icons/navbar/homeactive.svg',
                    color: colors.PrimaryColor,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset(
                    'assets/icons/navbar/home.svg',
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset(
                    'assets/icons/navbar/diaryactive.svg',
                    color: colors.PrimaryColor,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset(
                    'assets/icons/navbar/diary.svg',
                    color: Color.fromARGB(255, 156, 163, 175),
                  ),
                ),
                label: 'Diary'),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset(
                    'assets/icons/navbar/profileactive.svg',
                    color: colors.PrimaryColor,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                  child: SvgPicture.asset('assets/icons/navbar/profile.svg'),
                ),
                label: 'Profile'),
          ],
          showSelectedLabels: true,
          currentIndex: widget.currentIndex,
          onTap: switchPage,
        ),
        backgroundColor: Colors.white,
        body: widget.mainPages.elementAt(widget.currentIndex));
  }

  void switchPage(int value) {
    setState(() {
      widget.currentIndex = value;
    });
  }
}

import 'package:fitness_app/business_logic/cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart' as colors;

// ignore: must_be_immutable
class AppMainPage extends StatefulWidget {
  AppMainPage({super.key});
  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  late List<Widget> mainPages;
  @override
  void initState() {
    super.initState();
    MainPageCubit.get(context).initPages();
    mainPages = MainPageCubit.get(context).Screens;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
            extendBody: true,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: SvgPicture.asset(
                              'assets/icons/navbar/homeactive.svg',
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: SvgPicture.asset(
                              'assets/icons/navbar/book-active.svg',
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: SvgPicture.asset(
                              'assets/icons/navbar/book.svg',
                              height: 24,
                              width: 24,
                              color: Colors.white,
                            ),
                          ),
                          label: 'Diary'),
                      BottomNavigationBarItem(
                          activeIcon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: SvgPicture.asset(
                              'assets/icons/navbar/diaryactive.svg',
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: SvgPicture.asset(
                              'assets/icons/navbar/profileactive.svg',
                              height: 24,
                              width: 24,
                              color: Colors.white,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
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
                    currentIndex: MainPageCubit.get(context).currentIndex,
                    onTap: switchPage,
                  ),
                ),
              ),
            ),
            // backgroundColor: colors.BackgroundColor,
            // backgroundColor: Colors.transparent,
            body: IndexedStack(
                index: MainPageCubit.get(context).currentIndex,
                children: MainPageCubit.get(context).Screens));
      },
    );
  }

  void switchPage(int value) {
    MainPageCubit.get(context).changePage(value);
  }
}

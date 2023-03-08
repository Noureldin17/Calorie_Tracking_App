import 'package:fitness_app/presentation/widgets/OnBoarding/OnBoardingItem.dart';
import 'package:fitness_app/presentation/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/onboarding_viewlist.dart' as onboardinglist;
import '../../constants/pages.dart' as pages;
import '../colors.dart' as colors;

// ignore: must_be_immutable
class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key, this.LastPage});
  bool? LastPage;
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }

  PageController onBoardingPageController = PageController();

  @override
  Widget build(BuildContext context) {
    enterFullScreen(FullScreenMode.EMERSIVE);
    return Sizer(
      builder: (context, orientation, deviceType) => SafeArea(
        child: Scaffold(
          backgroundColor: colors.BackgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  alignment: AlignmentDirectional.topCenter,
                  height: orientation == Orientation.portrait ? 80.h : 80.w,
                  child: Container(
                    child: Expanded(
                      child: PageView.builder(
                        itemBuilder: (context, index) => OnBoardingItem(
                            model: onboardinglist.onboardinglist[index]),
                        itemCount: onboardinglist.onboardinglist.length,
                        physics: const BouncingScrollPhysics(),
                        controller: onBoardingPageController,
                        onPageChanged: (index) {
                          if (index == 2) {
                            widget.LastPage = true;
                          } else {
                            widget.LastPage = false;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: orientation == Orientation.portrait
                    ? EdgeInsetsDirectional.fromSTEB(0, 2.h, 0, 1.h)
                    : EdgeInsetsDirectional.fromSTEB(0, 2.w, 0, 1.w),
                child: SmoothPageIndicator(
                  controller: onBoardingPageController,
                  count: onboardinglist.onboardinglist.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 6.sp,
                      dotWidth: 6.sp,
                      expansionFactor: 2.sp,
                      activeDotColor: Color.fromARGB(255, 51, 102, 255),
                      dotColor: Color.fromARGB(255, 173, 200, 255)),
                ),
              ),
              Padding(
                padding: orientation == Orientation.portrait
                    ? EdgeInsets.only(top: 1.h, bottom: 0.h)
                    : EdgeInsets.only(top: 1.w, bottom: 0.w),
                child: PrimaryButton(
                  buttonText: 'Next',
                  OnPressed: () {
                    if (widget.LastPage == true) {
                      Navigator.pushReplacementNamed(
                          context, pages.App_Main_Page);
                    } else {
                      onBoardingPageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeInOut);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

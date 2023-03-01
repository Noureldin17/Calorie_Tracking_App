import 'package:fitness_app/presentation/widgets/OnBoardingItem.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/onboarding_viewlist.dart' as onboardinglist;
import '../colors.dart' as colors;

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key, this.LastPage});
  bool? LastPage;
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController onBoardingPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => SafeArea(
                child: Scaffold(
              backgroundColor: colors.BackgroundColor,
              body: Column(
                children: [
                  Stack(alignment: Alignment.topCenter, children: [
                    Container(
                      margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      alignment: AlignmentDirectional.topCenter,
                      height: 500.sp,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
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
                          )),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 7.sp, 0, 0),
                            child: SmoothPageIndicator(
                              controller: onBoardingPageController,
                              count: onboardinglist.onboardinglist.length,
                              effect: ExpandingDotsEffect(
                                  dotHeight: 6,
                                  dotWidth: 6,
                                  expansionFactor: 2,
                                  activeDotColor:
                                      Color.fromARGB(255, 51, 102, 255),
                                  dotColor: Color.fromARGB(255, 173, 200, 255)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            )));
  }
}

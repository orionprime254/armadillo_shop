import 'package:armadillo_shop/common/utils/kcolors.dart';
import 'package:armadillo_shop/src/onboarding/views/controller/onboarding_notifier.dart';
import 'package:armadillo_shop/src/onboarding/widgets/onboarding_pageone.dart';
import 'package:armadillo_shop/src/onboarding/widgets/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

import '../widgets/onboarding_pagetwo.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
        initialPage: context.read<OnboardingNotifier>().selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (page) {
            context.read<OnboardingNotifier>().setSelectedpage = page;
          },
          children: [OnboardingPageOne(), OnboardingPageTwo(), WelcomeScreen()],
        ),
        context.watch<OnboardingNotifier>().selectedPage == 2
            ? SizedBox.shrink()
            : Positioned(
                bottom: 50.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      context.watch<OnboardingNotifier>().selectedPage == 0
                          ? SizedBox(
                              width: 25,
                            )
                          : GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                    context
                                            .read<OnboardingNotifier>()
                                            .selectedPage -
                                        1,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Icon(
                                AntDesign.leftcircleo,
                                color: Kolors.kPrimary,
                                size: 30,
                              ),
                            ),
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.7,
                        height: 50.h,
                        child: PageViewDotIndicator(
                          currentItem:
                              context.watch<OnboardingNotifier>().selectedPage,
                          count: 3,
                          unselectedColor: Colors.black26,
                          selectedColor: Kolors.kPrimary,
                          duration: Duration(milliseconds: 200),
                        ),
                      ),
                      GestureDetector(
                        onTap: () { _pageController.animateToPage(
                            context
                                .read<OnboardingNotifier>()
                                .selectedPage +
                                1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);},
                        child: Icon(
                          AntDesign.rightcircleo,
                          color: Kolors.kPrimary,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ))
      ],
    ));
  }
}

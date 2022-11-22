import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/models/modelOnboaring.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignUp/WelcomeScreen.dart';
import 'package:rx_change_3/src/features/core/screens/onboarding/onboardingScreenWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int currentPageValue = 0;
  String buttonText = 'SKIP';
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void getChangedPageAndMoveBar(int page) {
    if (page == 2) {
      setState(() {
        buttonText = 'NEXT';
      });
    } else {
      setState(() {
        buttonText = 'SKIP';
      });
    }
    setState(() {
      currentPageValue = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 9,
              child: PageView(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                  Positioned(
                    bottom: 10,
                    child: AnimatedSmoothIndicator(
                        activeIndex: currentPageValue,
                        effect: const WormEffect(
                          activeDotColor: kVertclair,
                          // dotHeight: 5.0,
                        ),
                        count: 3),
                  );
                },
                children: <Widget>[
                  OnboardingPage(
                    model: OnboardingModel(
                      image: tOnBoarding1,
                      title: tOnboardingTitle1,
                      subTitle: tOnboardingSubTitle1,
                      counterText: tOnboardingCounter1,
                      bgColor: kOnboarding1Color,
                    ),
                  ),
                  OnboardingPage(
                    model: OnboardingModel(
                      image: tOnBoarding2,
                      title: tOnboardingTitle2,
                      subTitle: tOnboardingSubTitle2,
                      counterText: tOnboardingCounter2,
                      bgColor: kOnboarding2Color,
                    ),
                  ),
                  OnboardingPage(
                    model: OnboardingModel(
                      image: tOnBoarding3,
                      title: tOnboardingTitle3,
                      subTitle: tOnboardingSubTitle3,
                      counterText: tOnboardingCounter3,
                      bgColor: kOnboarding3Color,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 35),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       for (int i = 0; i < 3; i++)
            //         if (i == currentPageValue) ...[pageIndicator(true)] else
            //           pageIndicator(false),
            //     ],
            //   ),
            // // ),
            // Positioned(
            //   bottom: 10,
            //   child: AnimatedSmoothIndicator(
            //       activeIndex: currentPageValue,
            //       effect: const WormEffect(
            //         activeDotColor: kVertclair,
            //         // dotHeight: 5.0,
            //       ),
            //       count: 3),
            // ),
            // Positioned(
            //   bottom: 40.0,
            //   child: OutlinedButton(
            //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const WelcomeScreen())),
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.white,
            //       side: const BorderSide(color: kVertclair),
            //       shape: const CircleBorder(),
            //       padding: const EdgeInsets.all(10),
            //     ),
            //     child: Container(
            //       padding: const EdgeInsets.all(20),
            //       decoration: const BoxDecoration(
            //           color: kVertclair, shape: BoxShape.circle),
            //       child: const Icon(Icons.arrow_forward_ios),
            //     ),
            //   ),
            // ),

//             Expanded(
//               flex: 1,
//               child: Text(buttonText,
//                   textAlign: TextAlign.end,
//                   style: Theme.of(context).textTheme.headline3),
//             ),
          ],
        ),
      ),
    );
  }
}

// Widget pageIndicator(bool isActive) {
//   return Container(
//     height: 10,
//     width: 30,
//     margin: EdgeInsets.only(left: 10, right: 10),
//     child: DecoratedBox(
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: isActive ? kVertclair : kJauneclair,
//         borderRadius: BorderRadius.all(
//           Radius.elliptical(4, 4),
//         ),
//       ),
//     ),
//   );
// }

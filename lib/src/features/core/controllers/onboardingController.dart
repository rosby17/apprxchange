// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:rx_change_3/src/constants/constants.dart';

import '../models/modelOnboaring.dart';
import '../screens/onboarding/onboardingScreenWidget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
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
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  // ignore: non_constant_identifier_names
  OnPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}

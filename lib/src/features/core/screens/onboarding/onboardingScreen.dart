// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';
import 'package:rx_change_3/src/features/core/controllers/onboardingController.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.OnPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 40.0,
            child: OutlinedButton(
              onPressed: () => obcontroller.animateToNextSlide(),
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                foregroundColor: Colors.grey[200],
                side: const BorderSide(
                  color: kJauneclair,
                ),
              ),
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                    bottom: 50,
                    child: AnimatedSmoothIndicator(
                        activeIndex: obcontroller.currentPage.value,
                        effect: const WormEffect(
                          activeDotColor: kVertclair,
                          dotHeight: 10.0,
                        ),
                        count: 3),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: 20,
            child: TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WelcomeScreen())),
              child: const Text("Skip",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/controllers/onboardingController.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../authentification/mainPage.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => LiquidSwipe(
              pages: obcontroller.pages,
              liquidController: obcontroller.controller,
              onPageChangeCallback: obcontroller.OnPageChangeCallback,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 40.0,
              child: OutlinedButton(
                onPressed: () => obcontroller.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: kVertclair),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: kVertclair, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              top: 50.0,
              right: 20,
              child: TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MainPage())),
                child: const Text("Skip",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                  activeIndex: obcontroller.currentPage.value,
                  effect: const WormEffect(
                    activeDotColor: kVertclair,
                    dotHeight: 5.0,
                  ),
                  count: 3),
            ),
          ),
        ],
      ),
    );
  }
}

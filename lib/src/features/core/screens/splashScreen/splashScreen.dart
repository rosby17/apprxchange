import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import '../../controllers/splashScreenController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
        body: Stack(
      children: [
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            top: 80,
            left: splashScreenController.animate.value ? tDefautSize : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: splashScreenController.animate.value ? 1 : 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      tAppTagLine,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ]),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              left: splashScreenController.animate.value ? tDefautSize : -80,
              bottom: 100,
              child: const Image(image: AssetImage(tSplashImage))),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            left: splashScreenController.animate.value ? tDefautSize : -80,
            bottom: 40,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kJauneclair,
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: splashScreenController.animate.value ? 50 : -30,
            left: splashScreenController.animate.value ? 0 : -30,
            child: const Image(
                image: AssetImage(
              tSplashTopIcon,
            )),
          ),
        ),
      ],
    ));
  }
}

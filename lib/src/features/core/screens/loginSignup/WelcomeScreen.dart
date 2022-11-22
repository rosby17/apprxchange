import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/loginScreen.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/signUp.dart';

import '../../../../constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDark = brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDark ? kVertclair : kWhite,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: const AssetImage(
                        'assets/images/onboarding/Onboarding-pana.png'),
                    height: height * 0.6),
                Column(
                  children: [
                    Text('Bienvenue sur Rxchange',
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'La meilleur plateforme d\'achat et vente de cryptomonnaie',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text("Login".toUpperCase(),
                          style: Theme.of(context).textTheme.headline3),
                    )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SignUp());
                      },
                      child: Text("SignUp".toUpperCase(),
                          style: Theme.of(context).textTheme.headline3),
                    ))
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ]),
        ));
  }
}

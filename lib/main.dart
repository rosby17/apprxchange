import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/signInPageGoogle.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/stateLogin.dart';
import 'package:rx_change_3/src/repository/authentidicationRepository.dart';
import 'package:rx_change_3/src/utils/theme/theme.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
          )
      .then((value) => Get.put(AuthentificationRepository()));
  await dotenv.load(fileName: ".env");
  {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.kLightTheme,
      darkTheme: TAppTheme.kDarkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}

class MyAppGoogle extends StatelessWidget {
  MyAppGoogle({super.key});
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: FutureBuilder(
          future: _fbapp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You Have an error! ${snapshot.error.toString()}');
              return const Text('Something Went Wrong!');
            } else if (snapshot.hasData) {
              return Login();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
        // AnimatedSplashScreen(splash: 'assets/images/logo2.gif',
        //   pageTransitionType: PageTransitionType.bottomToTop,
        //   duration: 3000,
        //   nextScreen: MyHomePage(),
        // )
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:rx_change_3/src/utils/theme/theme.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.kLightTheme,
      darkTheme: TAppTheme.kDarkTheme,
      themeMode: ThemeMode.system,
      home: OnboardingScreen(),
    ),
  );
}

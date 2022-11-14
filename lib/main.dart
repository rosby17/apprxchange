import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rx_change_3/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorLight: kVertsombre,
        primaryColorDark: kVertsombre,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        'Mot de passe oublié': (context) => const ForgotPassword(),
        'Authentifier': (context) => const Accueil(),
        'mail de validation': (context) => const ForgotPassword(),
      },
    ),
  );
}

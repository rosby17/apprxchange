import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rx_change_3/palette.dart';
import 'screens/screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
        '/': (context) => const LoginprintApp(),
        'Connectez-vous': (context) => const Login(),
        'Mot de passe oublié': (context) => const ForgotPassword(),
        'Creer un compte': (context) => const SignUp(),
        'Se Connecter': (context) => const Accueil(),
        'Authentifier': (context) => const Accueil(),
        'mail de validation': (context) => const ForgotPassword(),
      },
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';
import 'screens/screen.dart';

void main() {
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
        '/': (context) => SignUp(),
        'Connectez-vous': (context) => const Login(),
        'Mot de passe oublié': (context) => const ForgotPassword(),
        'Creer un compte': (context) => const SignUp(),
        'Se Connecter': (context) => const Accueil(),
        'mail de validation': (context) => const ForgotPassword(),
      },
    ),
  );
}

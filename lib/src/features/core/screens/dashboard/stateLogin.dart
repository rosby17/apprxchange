import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/accueil.dart';
import 'package:rx_change_3/src/features/core/screens/dashboard/actions.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/loginScreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const Accueil();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something Went wrong!"),
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

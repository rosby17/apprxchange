// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:rx_change_3/src/common_widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/loginWidget/loginFooterWiget.dart';
import 'package:rx_change_3/src/features/core/screens/loginSignup/loginWidget/loginFormWidget.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';
import '../../../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: mdpController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    mdpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: kVertsombre,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefautSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Image(
                      image: const AssetImage(
                        'assets/images/onboarding/Mobile login-cuate.png',
                      ),
                      height: size.height * 0.3,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Welcome Login',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const LoginForm(),
                const SizedBox(height: 10),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rx_change_3/src/common_widgets/widgets.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/controllers/signUpController.dart';

import 'loginWidget/signUpFormWidget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Image.asset(
                      'assets/images/onboarding/Mobile login-cuate.png',
                      width: 200.0,
                    ),
                    Text('Get On Board!',
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(height: 5),
                    const SignForm(),
                    Text('Or', style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage(tGoogleLogoImage),
                                width: 25.0,
                              ),
                              label: Text(
                                'Sign-up with Google',
                                style: Theme.of(context).textTheme.subtitle2,
                              )),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {},
                          child: Text.rich(
                            TextSpan(
                                text: 'Already have an Account?',
                                style: Theme.of(context).textTheme.bodyText1,
                                children: const [
                                  TextSpan(
                                      text: ' SignIn',
                                      style: TextStyle(color: kVertclair)),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}

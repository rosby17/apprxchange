// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:rx_change_3/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../palette.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    return Scaffold(
      backgroundColor: kVertsombre,
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          // gradient: RG(),
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/images/rxchange_2blanc.png',
                    width: 300.0,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Welcome Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: kWhite,
                      fontFamily: "Poppins-SemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextInputField(
                    obscureText: false,
                    controller: emailController,
                    icon: Icons.mail,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  TextInputField(
                    obscureText: true,
                    icon: Icons.lock,
                    hint: 'Mot de passe',
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.text,
                    controller: mdpController,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'Mot de passe oublié'),
                      child: const Text(
                        'Mot de passe oublié?',
                        style: kStylepetittexte,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Bouton(
                    buttonName: 'Se connecter',
                    couleurs: kJaunesombre,
                    kcouleurs: kBodyStyleBouton1,
                    onTap: signIn,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Bouton(
                    buttonName: 'Creer un nouveau compte',
                    couleurs: kVertclair,
                    kcouleurs: kBodyStyleBouton2,
                    onTap: widget.showRegisterPage,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

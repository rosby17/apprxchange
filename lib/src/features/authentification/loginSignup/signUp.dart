// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rx_change_3/src/common_widgets/widgets.dart';
import 'package:rx_change_3/src/constants/constants.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  final comfirmmdpController = TextEditingController();
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final balanceController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    mdpController.dispose();
    comfirmmdpController.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    balanceController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: mdpController.text.trim(),
      );

      //add user details

      addUserDetails(
        firstNameController.text.trim(),
        lastNameController.text.trim(),
        emailController.text.trim(),
        userNameController.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String userName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'username': userName,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (mdpController.text.trim() == comfirmmdpController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kVertsombre,
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/rxchange_2blanc.png',
                    width: 200.0,
                  ),
                  const SizedBox(height: 30),
                  Text('Sign Up', style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextInputField(
                        icon: Icons.person,
                        hint: 'nom',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: firstNameController,
                      ),
                      const SizedBox(height: 10),
                      TextInputField(
                        icon: Icons.person,
                        hint: 'prenom',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: lastNameController,
                      ),
                      const SizedBox(height: 10),
                      TextInputField(
                        icon: Icons.person,
                        hint: 'username',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: userNameController,
                      ),
                      const SizedBox(height: 10),
                      TextInputField(
                        icon: Icons.email,
                        hint: 'Email',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: emailController,
                      ),
                      const SizedBox(height: 10),
                      TextInputField(
                        obscureText: true,
                        icon: Icons.lock,
                        hint: 'Mot de passe',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: mdpController,
                      ),
                      const SizedBox(height: 10),
                      TextInputField(
                        obscureText: true,
                        icon: Icons.lock,
                        hint: 'Confirmez le Mot de passe',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: comfirmmdpController,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Bouton(
                    buttonName: "S'inscrire",
                    couleurs: kJaunesombre,
                    kcouleurs: kBodyStyleBouton1,
                    onTap: signUp,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vous avez déjà un compte? ',
                          style: TextStyle(
                            fontSize: 15,
                            color: kWhite,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        MaterialButton(
                          onPressed: widget.showLoginPage,
                          child: const Text(
                            'Connectez-vous',
                            style: kBodyStyleBouton2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

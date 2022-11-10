// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:rxchange/screens/screen.dart';
import 'package:rx_change_3/widgets/widgets.dart';
import '../palette.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var mdpController = TextEditingController();

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
                    controller: emailController,
                    icon: Icons.mail,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  TextInputField(
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
                    onPressed: () {
                      Navigator.pushNamed(context, 'Se Connecter');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Bouton(
                    buttonName: 'Creer un nouveau compte',
                    couleurs: kVertclair,
                    kcouleurs: kBodyStyleBouton2,
                    onPressed: () {
                      Navigator.pushNamed(context, 'Creer un compte');
                    },
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

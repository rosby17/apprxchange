// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
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
        child: ListView(
          children: <Widget>[
            Container(
              // height: size.height * 0.9,
              height: 250.0,
              width: 80.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/rxchange_2blanc.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: kWhite,
                      fontFamily: "Poppins-SemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextInputField(
                        controller: emailController,
                        icon: Icons.mail,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      PassWordInput(
                        icon: Icons.lock,
                        hint: 'Mot de passe',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
                        controller: mdpController,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, 'Mot de passe oublié'),
                        child: SizedBox(
                          height: size.height * 0.09,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 150.0),
                            child: Text(
                              'Mot de passe oublié?',
                              style: kStylepetittexte,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

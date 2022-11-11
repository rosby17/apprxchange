// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';
import '../widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    // var mdpController = TextEditingController();
    // var confimPass = TextEditingController();
    // ServiceApi service = ServiceApi();

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // const BackgroundImage(image: 'assets/images/background.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: kVertclair,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: const Text(
              "Mot de passe oublié",
              style: kBodyStyleBouton2,
            ),
            centerTitle: true,
          ),
          body: SizedBox(
            height: size.height * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    child: const Text(
                      'Nous allons vous envoyer un email de récupération de compte, veuillez entrer votre adresse électronique ',
                      style: kBodyStyleBouton1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    controller: emailController,
                    icon: Icons.mail,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // ignore: missing_required_param
                  const Bouton(
                    buttonName: 'Envoyer',
                    couleurs: kJaunesombre,
                    kcouleurs: kBodyStyleBouton1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:rxchange/services/serviceApi.dart';
import 'package:rx_change_3/palette.dart';
import 'package:rx_change_3/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  // ServiceApi service = ServiceApi();
  var userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var mdpController = TextEditingController();
  var confimPass = TextEditingController();
  String user = '';
  String email = '';
  String mdp = '';
  String confirmPass = '';

  validatationForm() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      formkey.currentState!.reset();
    } else {
      debugPrint('Erreur');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kVertsombre,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              width: size.width * 0.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/rxchange_2blanc.png',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 1),
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    color: kWhite,
                    fontFamily: "Poppins-SemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // height: size.height * 0.48,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 5.0, right: 30.0, bottom: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Pseudo',
                              hintText: 'Entrez votre pseudo',
                              hintStyle: kBodyStyleZone,
                              labelStyle: kBodyStyleZone,
                              icon:
                                  Icon(Icons.person, color: kBlackS, size: 25),
                            ),
                            style: kBodyStyleZoneX,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (val) => val!.isEmpty
                                ? "Veuillez renseigner votre pseudo "
                                : null,
                            onChanged: (val) => user,
                            controller: userNameController,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 30.0, bottom: 10.0),
                          child: TextFormField(
                            validator: (val) => val!.isEmpty
                                ? "Veuillez completer ce champs "
                                : null,
                            onChanged: (val) => email,
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Entrez votre adresse email',
                              hintStyle: kBodyStyleZone,
                              labelStyle: kBodyStyleZone,
                              // border: UnderlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20)),
                              icon: Icon(Icons.email, color: kBlackS, size: 25),
                            ),
                            obscureText: true,
                            style: kBodyStyleZoneX,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 30.0, bottom: 15.0),
                          child: TextFormField(
                            controller: mdpController,
                            decoration: const InputDecoration(
                              labelText: 'Mot de passe',
                              hintText: 'Entrez votre mot de passe',
                              hintStyle: kBodyStyleZone,
                              labelStyle: kBodyStyleZone,
                              // border: InputBorder.none,
                              icon: Icon(Icons.lock, color: kBlackS, size: 25),
                            ),
                            validator: (val) => val!.length < 6
                                ? "Veuillez renseigner votre mot de passe "
                                : null,
                            onChanged: (val) => mdp,
                            obscureText: true,
                            style: kBodyStyleZoneX,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        // SizedBox(
                        //   height: size.height * 0.03,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 30.0, bottom: 25.0),
                          child: TextFormField(
                            onChanged: (val) => confirmPass = val,
                            // controller: confirmdpController,
                            decoration: const InputDecoration(
                              labelText: 'Confirmer votre Mot de passe',
                              hintText: 'Retapez votre mot de passe',
                              hintStyle: kBodyStyleZone,
                              labelStyle: kBodyStyleZone,
                              // border: InputBorder.none,
                              icon: Icon(Icons.lock, color: kBlackS, size: 25),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Veuillez confirmer votre mot de passe ";
                              } else if (confirmPass != mdp) {
                                return "Les mots de passe de correspondent pas ";
                              } else {
                                return null;
                              }
                            },

                            obscureText: true,
                            style: kBodyStyleZoneX,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Bouton(
                        buttonName: "S'inscrire",
                        couleurs: kJaunesombre,
                        kcouleurs: kBodyStyleBouton1,
                        onPressed: validatationForm,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Vous avez déjà un compte? ',
                                style: kStylepetittexte2),
                            FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "Connectez-vous");
                              },
                              child: const Text(
                                'Connectez-vous',
                                style: kBodyStyleBouton2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/rxchange_2blanc.png',
                    width: 200.0,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      color: kWhite,
                      fontFamily: "Poppins-SemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: size.height * 0.32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextInputField(
                                icon: Icons.person,
                                hint: 'username',
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.text,
                                controller: mdpController,
                              ),
                              TextInputField(
                                icon: Icons.email,
                                hint: 'Email',
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.text,
                                controller: mdpController,
                              ),
                              TextInputField(
                                icon: Icons.lock,
                                hint: 'Mot de passe',
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.text,
                                controller: mdpController,
                              ),
                              TextInputField(
                                icon: Icons.lock,
                                hint: 'Confirmez le Mot de passe',
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.text,
                                controller: mdpController,
                              ),
                            ],
                          ),
                        ),
// Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                           child:
                        // TextFormField(
                        //     decoration: InputDecoration(
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(color: kWhite),
                        //           borderRadius: BorderRadius.circular(12),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide:
                        //               const BorderSide(color: kJauneclair),
                        //           borderRadius: BorderRadius.circular(12),
                        //         ),
                        //         fillColor: Colors.grey[200],
                        //         filled: true,
                        //         labelText: 'username',
                        //         hintText: 'Entrez votre username',
                        //         hintStyle: kBodyStyleZone,
                        //         labelStyle: kBodyStyleZone,
                        //         prefixIcon: const Padding(
                        //             padding:
                        //                 EdgeInsets.symmetric(vertical: 10.0),
                        //             child: Icon(Icons.person,
                        //                 color: kBlackS, size: 25))),
                        //     style: kBodyStyleZoneX,
                        //     keyboardType: TextInputType.name,
                        //     textInputAction: TextInputAction.next,
                        //     validator: (val) => val!.isEmpty
                        //         ? "Veuillez renseigner votre username "
                        //         : null,
                        //     onChanged: (val) => user,
                        //     controller: userNameController,
                        //   ),
                        // ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: TextFormField(
                        //     validator: (val) => val!.isEmpty
                        //         ? "Veuillez completer ce champs "
                        //         : null,
                        //     onChanged: (val) => email,
                        //     controller: emailController,
                        //     decoration: const InputDecoration(
                        //       labelText: 'Email',
                        //       hintText: 'Entrez votre adresse email',
                        //       hintStyle: kBodyStyleZone,
                        //       labelStyle: kBodyStyleZone,
                        //       // border: UnderlineInputBorder(
                        //       //     borderRadius: BorderRadius.circular(20)),
                        //       icon: Icon(Icons.email, color: kBlackS, size: 25),
                        //     ),
                        //     obscureText: true,
                        //     style: kBodyStyleZoneX,
                        //     keyboardType: TextInputType.emailAddress,
                        //     textInputAction: TextInputAction.next,
                        //   ),
                        // ),

                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 5.0, right: 30.0, bottom: 15.0),
                        //   child: TextFormField(
                        //     controller: mdpController,
                        //     decoration: const InputDecoration(
                        //       labelText: 'Mot de passe',
                        //       hintText: 'Entrez votre mot de passe',
                        //       hintStyle: kBodyStyleZone,
                        //       labelStyle: kBodyStyleZone,
                        //       // border: InputBorder.none,
                        //       icon: Icon(Icons.lock, color: kBlackS, size: 25),
                        //     ),
                        //     validator: (val) => val!.length < 6
                        //         ? "Veuillez renseigner votre mot de passe "
                        //         : null,
                        //     onChanged: (val) => mdp,
                        //     obscureText: true,
                        //     style: kBodyStyleZoneX,
                        //     keyboardType: TextInputType.text,
                        //     textInputAction: TextInputAction.done,
                        //   ),
                        // ),
                        // // SizedBox(
                        // //   height: size.height * 0.03,
                        // // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 5.0, right: 30.0, bottom: 25.0),
                        //   child: TextFormField(
                        //     onChanged: (val) => confirmPass = val,
                        //     // controller: confirmdpController,
                        //     decoration: const InputDecoration(
                        //       labelText: 'Confirmer votre Mot de passe',
                        //       hintText: 'Retapez votre mot de passe',
                        //       hintStyle: kBodyStyleZone,
                        //       labelStyle: kBodyStyleZone,
                        //       // border: InputBorder.none,
                        //       icon: Icon(Icons.lock, color: kBlackS, size: 25),
                        //     ),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "Veuillez confirmer votre mot de passe ";
                        //       } else if (confirmPass != mdp) {
                        //         return "Les mots de passe de correspondent pas ";
                        //       } else {
                        //         return null;
                        //       }
                        //     },

                        //     obscureText: true,
                        //     style: kBodyStyleZoneX,
                        //     keyboardType: TextInputType.text,
                        //     textInputAction: TextInputAction.done,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 40,
                        ),
                        Bouton(
                          buttonName: "S'inscrire",
                          couleurs: kJaunesombre,
                          kcouleurs: kBodyStyleBouton1,
                          onPressed: validatationForm,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width * 0.8,
                          // padding: const EdgeInsets.all(50),
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
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "Connectez-vous");
                                },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

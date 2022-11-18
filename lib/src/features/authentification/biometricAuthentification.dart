// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:async';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';

import '../../common_widgets/bouton.dart';

class LoginprintApp extends StatefulWidget {
  const LoginprintApp({Key? key}) : super(key: key);

  @override
  State<LoginprintApp> createState() => _LoginprintAppState();
}

class _LoginprintAppState extends State<LoginprintApp> {
  final LocalAuthentication auth = LocalAuthentication();

  // ignore: unused_field
  String _authorized = 'Pas Authorisé';
  // ignore: unused_field
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
  }

  // ignore: unused_element
  Future<void> _getAvailableBiometrics() async {
    // ignore: unused_local_variable
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException {
      availableBiometrics = <BiometricType>[];
    }
    if (!mounted) {
      return;
    }

    setState(() {});
  }

  //cette fonction ouvrira une boîte de dialogue d'authentification
// et il vérifiera si nous sommes authentifiés ou non
// nous allons donc ajouter l'action majeure ici comme passer à une autre activité
// ou simplement afficher un texte qui nous dira que nous sommes authentifiés

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scannez votre empreinte digitale pour vous authentifier',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) return;
    if (authenticated) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Accueil()));
    }
    setState(() {
      _authorized =
          authenticated ? "Succès autorisé" : "Échec de l'authentification";
    });
  }

  // ignore: unused_element
  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  // ignore: unused_element
  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: <Widget>[
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/rxchange_2blanc.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              width: size.width * 0.6,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        color: kWhite,
                        fontFamily: "Poppins-SemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/fingerprint.png',
                          width: 150.0,
                          color: kWhite,
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Authentification",
                          style: TextStyle(
                            color: kWhite,
                            fontSize: 22.0,
                            fontFamily: "Poppins-SemiBold",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          width: 300.0,
                          child: const Text(
                            "Authentifiez-vous en utilisant votre empreinte digitale au lieu de votre mot de passe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kWhite,
                              fontFamily: "Poppins-Regular",
                              fontSize: 16.0,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Bouton(
                    buttonName: ' S\'authentifier',
                    couleurs: kJaunesombre,
                    kcouleurs: kBodyStyleBouton1,
                    onTap: _authenticate,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text(
                  //       'Se connecter avec un mot de passe: ',
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         color: kWhite,
                  //         fontFamily: "Poppins-SemiBold",
                  //         fontWeight: FontWeight.w200,
                  //       ),
                  //     ),
                  //     MaterialButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, "Connectez-vous");
                  //       },
                  //       child: const Text(
                  //         'Sign Up',
                  //         style: kBodyStyleBouton2,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // ignore: unused_element
// enum _SupportState {
//   // ignore: unused_field
//   unknown,
//   // ignore: unused_field
//   supported,
//   // ignore: unused_field
//   unsupported,
// }

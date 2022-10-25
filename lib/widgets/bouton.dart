// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Bouton extends StatelessWidget {
  const Bouton({
    Key? key,
    required this.buttonName,
    required this.couleurs,
    required this.kcouleurs,
    @required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final Color couleurs;
  final TextStyle kcouleurs;

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.07,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: couleurs,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: kcouleurs,
        ),
      ),
    );
  }
}

class BoutonLong extends StatelessWidget {
  BoutonLong({
    Key? key,
    @required this.onPressed,
    required this.buttonName,
    required this.couleurs,
    required this.kcouleurs,
  }) : super(key: key);

  final String buttonName;
  final Color couleurs;
  final TextStyle kcouleurs;

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      height: size.height * 0.075,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: couleurs,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 7),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: kcouleurs,
          ),
        ),
      ),
    );
  }
}

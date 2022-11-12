// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Bouton extends StatelessWidget {
  const Bouton({
    Key? key,
    required this.buttonName,
    required this.couleurs,
    required this.kcouleurs,
    @required this.onTap,
  }) : super(key: key);

  final String buttonName;
  final Color couleurs;
  final TextStyle kcouleurs;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: couleurs,
          ),
          child: Center(
            child: Text(
              buttonName,
              style: kcouleurs,
            ),
          ),
        ),
      ),
    );
  }
}

class BoutonLong extends StatelessWidget {
  const BoutonLong({
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
        borderRadius: BorderRadius.circular(12),
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

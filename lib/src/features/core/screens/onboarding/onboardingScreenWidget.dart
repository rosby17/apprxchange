// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:rx_change_3/src/features/core/models/modelOnboaring.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefautSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                model.title,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              ),
              Text(
                model.subTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: kBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          // Text(model.counterText, style: Theme.of(context).textTheme.headline5),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

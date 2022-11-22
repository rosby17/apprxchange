// ignore_for_file: file_names
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        foregroundColor: kWhite,
        backgroundColor: kJauneclair,
        side: const BorderSide(color: kJauneclair),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        )),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        foregroundColor: kBlack,
        backgroundColor: kVertclair,
        side: const BorderSide(color: kVertclair),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        )),
  );
}

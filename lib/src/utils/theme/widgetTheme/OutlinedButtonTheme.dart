import 'package:rx_change_3/src/constants/constants.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        foregroundColor: kJauneclair,
        side: const BorderSide(
          color: kJauneclair,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        )),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        foregroundColor: kWhite,
        side: const BorderSide(
          color: kWhite,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        )),
  );
}

import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: kBlack,
    floatingLabelStyle: TextStyle(color: kBlack),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: kJauneclair)),
  );
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: kWhite,
    floatingLabelStyle: TextStyle(color: kWhite),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(width: 2, color: kVertclair)),
  );
}

import 'package:flutter/material.dart';
import 'package:rx_change_3/src/utils/theme/widgetTheme/ElevatedButtonTheme.dart';
import 'package:rx_change_3/src/utils/theme/widgetTheme/OutlinedButtonTheme.dart';
import 'package:rx_change_3/src/utils/theme/widgetTheme/textFielTheme.dart';
import 'package:rx_change_3/src/utils/theme/widgetTheme/textTheme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData kLightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    primarySwatch: Colors.green,
  );

  static ThemeData kDarkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    primarySwatch: Colors.yellow,
  );
}

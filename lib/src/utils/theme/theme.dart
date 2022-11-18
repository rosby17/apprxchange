import 'package:flutter/material.dart';
import 'package:rx_change_3/src/utils/theme/widgetTheme/textTheme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData kLightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
  );

  static ThemeData kDarkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
  );
}

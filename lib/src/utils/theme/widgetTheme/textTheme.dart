// ignore_for_file: file_names
import 'package:rx_change_3/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: kBlack,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: kBlack,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: kBlack,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kBlack,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: kBlack,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: kWhite,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: kBlack,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: kWhite,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: kWhite,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: kWhite,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kWhite,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: kWhite,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: kWhite,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: kWhite,
    ),
  );
}

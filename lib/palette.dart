import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);
// couleur de base
const Color kWhite = Colors.white;
const Color kBlack = Colors.black;

// couleur pour champ de texte
const Color kBlackS = Colors.black26;

// Parametre theme vert
const Color kVertclair = Color(0XFF079A24);
const Color kVertsombre = Color(0XFF045414);

// Parametre theme jaune
const Color kJauneclair = Color(0XffFFD600);
const Color kJaunesombre = Colors.amber;

final kTitleTextStyle = TextStyle(
  // fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  // fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  // fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
);

const TextStyle kBodyStyleZone = TextStyle(
  fontSize: 14,
  color: kBlackS,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w500,
);
const TextStyle kBodyStyleZoneX = TextStyle(
  fontSize: 14,
  color: kBlack,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w500,
);
const TextStyle kBodyStyleZone2 = TextStyle(
  fontSize: 13,
  color: kBlack,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w600,
);

const TextStyle kBodyStyleBouton1 = TextStyle(
  fontSize: 20,
  color: kBlack,
  fontFamily: "Poppins-SemiBold",
  fontWeight: FontWeight.w600,
);
const TextStyle kBodyStyleBouton4 = TextStyle(
  fontSize: 20,
  color: Colors.black87,
  fontFamily: "Poppins-SemiBold",
  fontWeight: FontWeight.w700,
);
const TextStyle kBodyStyleBouton2 = TextStyle(
  fontSize: 15,
  color: kWhite,
  fontFamily: "Poppins-SemiBold",
  fontWeight: FontWeight.w600,
);

const TextStyle kBodyStyleBouton3 = TextStyle(
  fontSize: 25,
  color: kWhite,
  fontFamily: "Poppins-SemiBold",
  fontWeight: FontWeight.w600,
);
const TextStyle kBodyStyle = TextStyle(
  fontSize: 16,
  color: kWhite,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w500,
);

const TextStyle kStylepetittexte = TextStyle(
  fontSize: 12,
  color: kWhite,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w500,
);
const TextStyle kStylepetittexte2 = TextStyle(
  fontSize: 12,
  color: kWhite,
  fontFamily: "Poppins-Medium",
  fontWeight: FontWeight.w500,
);

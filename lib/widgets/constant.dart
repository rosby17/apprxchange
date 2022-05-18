import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rx_change_3/palette.dart';

//String baseURL = "10.0.2.2:3000"; //local blockchain
String baseURL = "192.168.1.46:3000"; //deployed blockchain

class Constants {
  static List<Icon> iconList = [
    Icon(
      Icons.arrow_upward_rounded,
      color: kWhite,
    ),
  ];

  static List<String> titleList = [
    "2/17/2021",
  ];

  static List<String> subtitleList = [
    "#1Z10689450",
  ];

  static List<String> subtitleList2 = [
    "0.2565482 BTC",
    "0.4253245 ETH",
    "1.2756954 LTC",
  ];
  static List<int> amountList = [
    2010,
  ];

  static List<String> strList = [
    "1 \n Month",
    "6 \n Month",
    "1 \n Year",
  ];

  static List<String> titleList2 = [
    "Bitcoin",
    "Ethereum",
    "LiteCoin",
  ];
}

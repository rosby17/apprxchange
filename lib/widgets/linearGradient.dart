// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

LinearGradient LG() {
  return const LinearGradient(
    colors: [
      // kVertclair,
      kVertclair,
      kVertsombre,

      // kJauneclair,
      // kJaunesombre,
    ],
    begin: Alignment(-1.0, 0.0),
    end: Alignment.bottomLeft,
  );
}

RadialGradient RG() {
  return const RadialGradient(
    colors: [
      kVertclair,

      // kJaunesombre,
      kJaunesombre,
      kVertsombre,
    ],
    stops: [0.2, 0.4, 0.2],
    center: Alignment.bottomLeft,
    radius: 1.0,
    tileMode: TileMode.repeated,
  );
}

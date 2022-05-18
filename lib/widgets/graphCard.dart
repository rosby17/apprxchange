import 'package:flutter/material.dart';

import 'package:rx_change_3/palette.dart';

class GraphCardWidget extends StatelessWidget {
  final String title;
  final Color activeColor, fontColor;
  final bool isActive;

  // final int activeIndex;

  GraphCardWidget({
    Key? key,
    required this.title,
    required this.fontColor,
    required this.isActive,
    // required this.activeIndex,
    required this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 6.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: activeColor,
      ),
      child: Center(
        child: Text(title, textAlign: TextAlign.center, style: kBodyStyle),
      ),
    );
  }
}

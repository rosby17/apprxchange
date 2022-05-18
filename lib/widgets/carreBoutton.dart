import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class carreBoutton extends StatelessWidget {
  const carreBoutton({
    Key? key,
    required this.couleur,
    required this.text,
    required this.icone,
    @required this.onPressed,
  }) : super(key: key);
  final Color couleur;
  final String text;
  final Icon icone;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: couleur,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: icone,
          ),
        ),
        Center(
            child: Text(
          text,
          style: kBodyStyleZone2,
        )),
      ],
    );
  }
}

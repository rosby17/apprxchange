import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final int? value;
  const ButtonContainer(
      {super.key,
      required this.title,
      required this.color,
      required this.onTap,
      this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
          ),
        ),
      ),
    );
  }
}

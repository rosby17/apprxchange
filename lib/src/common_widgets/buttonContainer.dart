// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;
  const ButtonContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width / 3.5,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: active ? kJauneclair : Colors.blueGrey.withOpacity(.10),
      ),
      child: TextButton(
          onPressed: onTap,
          child: Text(title, style: Theme.of(context).textTheme.headline3)),
    );
  }
}

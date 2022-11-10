// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [
          kVertsombre,
          Colors.transparent,
        ],
      ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              kVertclair,
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}

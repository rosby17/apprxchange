// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rx_change_3/palette.dart';

class PassWordInput extends StatelessWidget {
  const PassWordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  final TextEditingController controller;

  // get color => null;

  @override
  Widget build(BuildContext context) {
    String password = '';

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.065,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(icon, color: kBlackS, size: 25),
              ),
              hintText: hint,
              hintStyle: kBodyStyleZone,
            ),
            validator: (val) =>
                val!.isEmpty ? "Veuillez completer ce champs " : null,
            onSaved: (val) => password,
            obscureText: true,
            style: kBodyStyleZoneX,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

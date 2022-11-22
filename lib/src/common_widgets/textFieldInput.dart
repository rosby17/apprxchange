// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:rx_change_3/src/constants/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? kWhite : kBlackS;
    var champColor = isDark ? kBlack : kWhite;

    String nom = '';
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kJauneclair),
            borderRadius: BorderRadius.circular(12),
          ),
          // border: InputBorder.none,

          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Icon(icon, color: iconColor, size: 25),
          ),
          fillColor: champColor.withOpacity(0.1),
          filled: true,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText1,
        ),
        validator: (val) => val!.isEmpty ? "Veuillez remplir  ce champs" : null,
        onSaved: (val) => nom,
        style: Theme.of(context).textTheme.bodyText1,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}

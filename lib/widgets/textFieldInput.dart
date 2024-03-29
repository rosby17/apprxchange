// ignore_for_file: file_names
import 'package:rx_change_3/palette.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
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
            child: Icon(icon, color: kBlackS, size: 25),
          ),
          fillColor: Colors.grey[200],
          filled: true,
          hintText: hint,
          hintStyle: kBodyStyleZone,
        ),
        validator: (val) => val!.isEmpty ? "Veuillez remplir  ce champs" : null,
        onSaved: (val) => nom,
        style: kBodyStyleZoneX,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}

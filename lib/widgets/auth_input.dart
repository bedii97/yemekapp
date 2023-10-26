import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

// ignore: must_be_immutable
class AuthInput extends StatelessWidget {
  String hint;
  bool isPassword;
  AuthInput({
    super.key,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Palette.hintTextColor,
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 3,
            color: Palette.inputBorderColor,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

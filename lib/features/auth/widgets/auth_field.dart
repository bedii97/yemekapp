// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yemek_app/theme/palette.dart';

// ignore: must_be_immutable
class AuthField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool isPassword;
  String? Function(String?)? validation;

  AuthField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.isPassword = false,
      this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0),
        focusedErrorBorder: outlineInputBorder,
        filled: true,
        fillColor: Palette.whiteColor,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        // contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Palette.greyColor,
        ),
      ),
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Palette.white200Color,
        ),
      );
}

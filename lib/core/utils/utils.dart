import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Palette.greenColor,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

String getNameFromEmail(String email) {
  return email.split('@')[0];
}

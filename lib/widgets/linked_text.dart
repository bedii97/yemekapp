import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

class LinkedText extends StatelessWidget {
  final String text;
  final void Function() function;
  const LinkedText({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
            color: Palette.greenColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

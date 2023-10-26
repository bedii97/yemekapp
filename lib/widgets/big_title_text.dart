import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

// ignore: must_be_immutable
class BigTitleText extends StatelessWidget {
  String text;
  BigTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Palette.greenColor,
        fontSize: 36.0,
      ),
    );
  }
}

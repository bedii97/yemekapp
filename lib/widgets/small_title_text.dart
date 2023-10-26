import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

// ignore: must_be_immutable
class SmallTitleText extends StatelessWidget {
  String text;
  SmallTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Palette.greyColor,
        fontSize: 16.0,
      ),
    );
  }
}

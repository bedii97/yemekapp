import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final void Function() function;
  const CommonButton({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Palette.greenColor,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
            color: Palette.whiteColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

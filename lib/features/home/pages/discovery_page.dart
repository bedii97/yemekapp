import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            //Gesture ile yapta basılı tutunca dışarı taşıyor efekt
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            filled: true,
            fillColor: Palette.whiteColor,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0),
            focusedErrorBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Palette.white200Color,
        ),
      );
}

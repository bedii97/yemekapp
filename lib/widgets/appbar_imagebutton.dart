import 'package:flutter/material.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarImageButton extends StatelessWidget {
  AppbarImageButton({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: 22.adaptSize,
          width: 22.adaptSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

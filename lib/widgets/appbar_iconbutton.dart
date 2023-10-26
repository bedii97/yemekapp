import 'package:flutter/material.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarIconbutton extends StatelessWidget {
  AppbarIconbutton({
    Key? key,
    this.icon,
    this.iconColor,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  IconData? icon;
  Color? iconColor;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 50.adaptSize,
          width: 50.adaptSize,
          padding: EdgeInsets.all(9.h),
          decoration: IconButtonStyleHelper.fillOnPrimary,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

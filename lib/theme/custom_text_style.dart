import 'package:flutter/material.dart';
import 'package:yemek_app/theme/palette.dart';
import 'package:yemek_app/theme/theme_helper.dart';
import 'package:yemek_app/core/utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeBluegray900cc => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray900Cc,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeGray50001Light => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeRobotoBluegray900cc =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.blueGray900Cc,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumInterGray500 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallAmber700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.amber700,
      );
  static get bodySmallAmber70001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.amber70001,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.7),
      );
  static get bodySmallOnPrimary_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  // Display text style
  static get displaySmallInterBlack900 =>
      theme.textTheme.displaySmall!.inter.copyWith(
        color: appTheme.black900,
      );
  // Label text style
  static get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get labelLargeGray600_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get labelLargeOnErrorContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.5),
      );
  static get labelLargeSatoshi => theme.textTheme.labelLarge!.satoshi;
  // Title text style
  static get titleLargeOnPrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumInterBlack900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
      );
  static get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterPrimaryContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get titleSmallAbhayaLibreExtraBoldOnPrimary =>
      theme.textTheme.titleSmall!.abhayaLibreExtraBold.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w800,
      );
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryBold => theme.textTheme.titleSmall!.copyWith(
        color: Palette.whiteColor,
        fontWeight: FontWeight.w900,
      );
  static get titleSmallSFProDisplayOnPrimary =>
      theme.textTheme.titleSmall!.sFProDisplay.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
}

extension on TextStyle {
  TextStyle get satoshi {
    return copyWith(
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get abhayaLibreExtraBold {
    return copyWith(
      fontFamily: 'Abhaya Libre ExtraBold',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}

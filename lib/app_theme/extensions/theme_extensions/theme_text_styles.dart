import 'package:flutter/material.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle currentLocationName;
  final TextStyle cardTitle;
  final TextStyle info;
  final TextStyle infoAnnotation;
  final TextStyle option;

  const ThemeTextStyles({
    required this.currentLocationName,
    required this.cardTitle,
    required this.info,
    required this.infoAnnotation,
    required this.option,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? currentLocationName,
    TextStyle? cardTitle,
    TextStyle? info,
    TextStyle? infoAnnotation,
    TextStyle? option,
  }) {
    return ThemeTextStyles(
      currentLocationName: currentLocationName ?? this.currentLocationName,
      cardTitle: cardTitle ?? this.cardTitle,
      info: info ?? this.info,
      infoAnnotation: infoAnnotation ?? this.infoAnnotation,
      option: option ?? this.option,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      ThemeExtension<ThemeTextStyles>? other,
      double t,
      ) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      currentLocationName: TextStyle.lerp(currentLocationName, other.currentLocationName, t)!,
      cardTitle: TextStyle.lerp(cardTitle, other.cardTitle, t)!,
      info: TextStyle.lerp(info, other.info, t)!,
      infoAnnotation: TextStyle.lerp(infoAnnotation, other.infoAnnotation, t)!,
      option: TextStyle.lerp(option, other.option, t)!,
    );
  }
}
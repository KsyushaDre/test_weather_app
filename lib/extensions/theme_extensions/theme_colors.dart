import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color infoNowCardColor;
  //todo rename var
  final Color infoTodayCardColor;

  const ThemeColors({
    required this.infoNowCardColor,
    required this.infoTodayCardColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? infoNowCardColor,
    Color? infoTodayCardColor,
  }) {
    return ThemeColors(
      infoNowCardColor: infoNowCardColor ?? this.infoNowCardColor,
      infoTodayCardColor: infoTodayCardColor ?? this.infoTodayCardColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      infoNowCardColor: Color.lerp(infoNowCardColor, other.infoNowCardColor, t)!,
      infoTodayCardColor: Color.lerp(infoTodayCardColor, other.infoTodayCardColor, t)!,
    );
  }
}

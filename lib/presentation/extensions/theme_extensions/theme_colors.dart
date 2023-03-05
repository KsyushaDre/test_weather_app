import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color infoNowCardColor;
  final Color forecastInfoCardColor;

  const ThemeColors({
    required this.infoNowCardColor,
    required this.forecastInfoCardColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? infoNowCardColor,
    Color? forecastInfoCardColor,
  }) {
    return ThemeColors(
      infoNowCardColor: infoNowCardColor ?? this.infoNowCardColor,
      forecastInfoCardColor: forecastInfoCardColor ?? this.forecastInfoCardColor,
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
      infoNowCardColor: Color.lerp(infoNowCardColor, other.infoNowCardColor, t) ?? other.infoNowCardColor,
      forecastInfoCardColor: Color.lerp(forecastInfoCardColor, other.forecastInfoCardColor, t) ?? other.forecastInfoCardColor,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_weather_app/extensions/theme_extensions/theme_colors.dart';
import 'package:test_weather_app/extensions/theme_extensions/theme_text_styles.dart';

extension BuildContextColorThemeExtension on BuildContext {
  Color get infoNowCardColor => Theme.of(this).extension<ThemeColors>()!.infoNowCardColor;

  Color get infoTodayCardColor => Theme.of(this).extension<ThemeColors>()!.infoTodayCardColor;
}

extension BuildContextTextThemeExtension on BuildContext {
  TextStyle get currentLocationName => Theme.of(this).extension<ThemeTextStyles>()!.currentLocationName;

  TextStyle get cardTitle => Theme.of(this).extension<ThemeTextStyles>()!.cardTitle;

  TextStyle get info => Theme.of(this).extension<ThemeTextStyles>()!.info;

  TextStyle get infoAnnotation => Theme.of(this).extension<ThemeTextStyles>()!.infoAnnotation;

  TextStyle get option => Theme.of(this).extension<ThemeTextStyles>()!.option;
}

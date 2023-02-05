import 'package:flutter/material.dart';
import 'package:test_weather_app/app_theme/extensions/theme_extensions/theme_colors.dart';
import 'package:test_weather_app/app_theme/extensions/theme_extensions/theme_text_styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFE1F5FE),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        ThemeColors(
          infoNowCardColor: Color(0xFF81D4FA),
          infoTodayCardColor: Color(0xFFB3E5FC),
        ),
        ThemeTextStyles(
          currentLocationName: TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          cardTitle: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          info: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          infoAnnotation: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          option: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static const TextTheme textTheme = TextTheme();
}

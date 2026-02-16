import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Jost',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.background,
      filled: true,
      hintStyle: TextStyles.body3.copyWith(color: AppColors.grayScale60),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Jost',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );
}

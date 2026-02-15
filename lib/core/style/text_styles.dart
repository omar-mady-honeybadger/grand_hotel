import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';

class TextStyles {
  static const double _defaultLetterSpacing = 0.5;

  static TextStyle h4 = TextStyle(
    fontSize: 24,
    color: AppColors.grayScale100,
    fontWeight: FontWeight.w700,
    letterSpacing: _defaultLetterSpacing, 
  );

  static TextStyle body1 = TextStyle(
    fontSize: 18,
    color: AppColors.grayScale100,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );

  static TextStyle body2 = TextStyle(
    fontSize: 16,
    color: AppColors.grayScale100,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );

  static TextStyle body3 = TextStyle(
    fontSize: 14,
    color: AppColors.grayScale100,
    fontWeight: FontWeight.w600,
    letterSpacing: _defaultLetterSpacing,
  );
}
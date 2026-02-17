import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class Headline extends StatelessWidget {
  const Headline({super.key, required this.label, required this.message});

  final String label;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyles.jostH4),
        SizedBox(height: 8,),
        Text(
          message,
          style: TextStyles.jostBody3.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grayScale90,
          ),
        ),
      ],
    );
  }
}

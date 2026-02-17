import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class Headline extends StatelessWidget {
  const Headline({
    super.key,
    required this.label,
    required this.textButtonLabel,
    this.textButtonColor = AppColors.primary,
  });

  final String label;
  final String textButtonLabel;
  final Color textButtonColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyles.jostBody2.copyWith(color: AppColors.black),
        ),
        Spacer(),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero,),
          onPressed: () {},
          child: Text(
            textButtonLabel,
            style: TextStyles.plusJakartaSansBody3.copyWith(
              color: textButtonColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class AuthActionRow extends StatelessWidget {
  const AuthActionRow({
    super.key,
    required this.action,
    required this.description,
    required this.descriptionColor,
    required this.onPressed,
    this.fontWeight,
  });

  final String description;
  final String action;
  final Color descriptionColor;
  final FontWeight? fontWeight;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: TextStyles.jostBody2.copyWith(
            color: descriptionColor,
            fontWeight: fontWeight,
          ),
        ),
        SizedBox(width: 4),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            action,
            style: TextStyles.jostBody2.copyWith(
              color: AppColors.primary,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}

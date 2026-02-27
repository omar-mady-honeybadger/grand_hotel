import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class DetailsLineWidget extends StatelessWidget {
  const DetailsLineWidget({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.jostBody2.copyWith(color: AppColors.grayScale80),
        ),
        Spacer(),
        Text('\$${price.toInt()}', style: TextStyles.jostBody1),
      ],
    );
  }
}

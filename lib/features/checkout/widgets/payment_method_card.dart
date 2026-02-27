import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.imagePath,
    required this.text,
    required this.isSelected,
  });
  final String imagePath;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 80,
            color: Color(0xffA7AEC1).withValues(alpha: 0.15),
            offset: Offset(0, 4),
          ),
        ],
      ),

      height: 64,
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          SvgPicture.asset(imagePath, height: 24, width: 40, fit: BoxFit.cover),
          Gap(14),
          Text(
            text,
            style: TextStyles.jostBody3.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Checkbox(
            fillColor: WidgetStateProperty.all(
              isSelected ? AppColors.primary : AppColors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: isSelected,
            onChanged: (isSelected) {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class AddDebtCardSection extends StatelessWidget {
  const AddDebtCardSection({super.key});

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
          SvgPicture.asset(AppAssets.addSvg, height: 44, width: 44),
          Gap(14),
          Text(
            'Add Debit Card',
            style: TextStyles.jostBody3.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

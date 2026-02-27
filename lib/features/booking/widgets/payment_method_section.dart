import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 64,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
    
        side: BorderSide(
          color: AppColors.black.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(child: SvgPicture.asset(AppAssets.walletSvg)),
      ),
      title: Text(
        'FastPayz',
        style: TextStyles.jostBody2.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '******6587',
        style: TextStyles.jostBody3.copyWith(
          color: AppColors.grayScale80,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: Container(
          height: 38,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Edit',
              style: TextStyles.jostBody3.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

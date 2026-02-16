import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              Expanded(child: Divider(color: AppColors.grayScale30)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Or Sign In with",
                  style: TextStyles.body3.copyWith(
                    color: AppColors.grayScale60,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(child: Divider(color: AppColors.grayScale30)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 48,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 24.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(AppAssets.googleSvg),
            ),
            Container(
              width: 72,
              height: 48,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 24.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(AppAssets.facebookSvg),
            ),
            Container(
              width: 72,
              height: 48,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 24.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(AppAssets.appleSvg),
            ),
          ],
        ),
        SizedBox(height: 22),
        Text(
          'By signing up you agree to our Terms and Conditions of Use',
          style: TextStyles.body2.copyWith(
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

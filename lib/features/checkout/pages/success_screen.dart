import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Center(
        child: Column(
          children: [
            Gap(120),
            SvgPicture.asset(AppAssets.successSvg, height: 180),
            Text(
              'Payment Complete',
              style: TextStyles.jostBody1.copyWith(fontSize: 24),
            ),
            Gap(8),
            Text(
              'Etiam cras nec metus laoreet. Faucibus\n iaculis cras ut posuere.',
              textAlign: .center,
              style: TextStyles.jostBody3.copyWith(
                color: AppColors.grayScale70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

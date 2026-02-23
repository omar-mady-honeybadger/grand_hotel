import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class HotelFeatures extends StatelessWidget {
  const HotelFeatures({
    super.key,
    required this.feature,
    required this.path
  });

  final String feature;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(path),
          SizedBox(height: 4,),
          Text(
            feature,
            style: TextStyles.plusJakartaSansBody4
                .copyWith(
                  color: AppColors.grayScale70,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

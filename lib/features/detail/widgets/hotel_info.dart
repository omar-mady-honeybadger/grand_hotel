import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';

class HotelInfo extends StatelessWidget {
  const HotelInfo({
    super.key,
    required this.widget,
  });

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name ?? '',
                style: TextStyles.plusJakartaSansBody1,
              ),
              SizedBox(height: 9),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.locationFilledSvg,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    widget.product.location ?? '',
                    style: TextStyles.jostBody4.copyWith(
                      color: AppColors.grayScale60,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.star,
                    color: AppColors.warning,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${widget.product.review ?? 0.0}',
                    style: TextStyles.plusJakartaSansBody4,
                  ),
                ],
              ),
            ],
          ),
        ),
        SvgPicture.asset(AppAssets.rotateSvg),
      ],
    );
  }
}

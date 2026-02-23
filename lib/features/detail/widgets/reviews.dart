import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/section_header.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required this.widget,
  });

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24,left: 24,top: 4,bottom: 16),
          child: SectionHeader(
            label: 'Reviews',
            textButtonLabel: 'See All',
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              AppAssets.kimBorrdyPng,
            ),
          ),
          title: Row(
            children: [
              Text('Kim Borrdy', style: TextStyles.jostBody3),
              Spacer(),
              Icon(
                Icons.star,
                color: AppColors.semantic,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '${widget.product.review ?? 0.0}',
                style: TextStyles.plusJakartaSansBody4,
              ),
            ],
          ),
          subtitle: Text(
            'Amazing!  The room is good than the picture.'
            ' Thanks for amazing experience!',
            style: TextStyles.jostBody4.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.grayScale60,
            ),
          ),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              AppAssets.jzenklenPng,
            ),
          ),
          title: Row(
            children: [
              Text('Jzenklen', style: TextStyles.jostBody3),
              Spacer(),
              Icon(
                Icons.star,
                color: AppColors.semantic,
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                '${widget.product.review ?? 0.0}',
                style: TextStyles.plusJakartaSansBody4,
              ),
            ],
          ),
          subtitle: Text(
            'The service is on point, and I really like'
            ' the facilities. Good job!',
            style: TextStyles.jostBody4.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.grayScale60,
            ),
          ),
        ),
      ],
    );
  }
}

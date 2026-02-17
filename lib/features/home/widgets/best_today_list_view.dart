import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class BestTodayListView extends StatelessWidget {
  const BestTodayListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bestTodayProducts.length,
        padding: const EdgeInsets.only(left: 24.0, right: 8.0, bottom: 10.0),
        itemBuilder: (context, index) {
          var product = bestTodayProducts[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: AppColors.grayScale30),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    product.image ?? '',
                    height: 78,
                    width: 78,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name ?? '', style: TextStyles.jostBody2),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.locationFilledSvg),
                        const SizedBox(width: 3.0),
                        Text(
                          product.location ?? '',
                          style: TextStyles.jostBody3.copyWith(
                            color: AppColors.grayScale80,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.warning, size: 16.0),
                        SizedBox(width: 4.0),
                        Text(
                          '${product.review ?? 0.0}',
                          style: TextStyles.jostBody4.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ' (532)',
                          style: TextStyles.jostBody4.copyWith(
                            color: AppColors.grayScale60,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          '\$${product.price ?? 0}',
                          style: TextStyles.plusJakartaSansBody3.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '\$${product.originalPrice ?? 0}',
                          style: TextStyles.plusJakartaSansBody4.copyWith(
                            color: AppColors.error,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

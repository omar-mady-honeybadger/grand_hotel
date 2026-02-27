import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';

class HoteInfoCard extends StatelessWidget {
  const HoteInfoCard({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, ProductDetailScreen(product: model));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Hero(
              tag: model.tag ?? '',
              child: Image.asset(
                model.image ?? '',
                height: 78,
                width: 78,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        model.name ?? '',
                        style: TextStyles.jostBody2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.warning, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          '${model.review ?? 'N/A'}',
                          style: TextStyles.jostBody3.copyWith(
                            color: AppColors.grayScale100,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.locationSvg),
                      SizedBox(width: 4),
                      Text(
                        model.location ?? '',
                        style: TextStyles.jostBody4.copyWith(
                          color: AppColors.grayScale60,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyles.jostBody2.copyWith(
                      color: AppColors.grayScale100,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${model.price ?? 'N/A'}',
                        style: TextStyles.jostBody2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const TextSpan(text: ' / night'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

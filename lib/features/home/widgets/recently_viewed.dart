import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class RecentlyViewed extends StatelessWidget {
  const RecentlyViewed({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        var product = productList[index];
        return Row(
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
                          product.name ?? '',
                          style: TextStyles.jostBody2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.warning,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${product.review ?? 'N/A'}',
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
                          'San Diego, CA',
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
                          text: '\$${product.price ?? 'N/A'}',
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
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 32,
          thickness: 1,
          color: AppColors.grayScale30,
        );
      },
    );
  }
}
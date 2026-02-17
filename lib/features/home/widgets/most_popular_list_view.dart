import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class MostPopularListView extends StatelessWidget {
  const MostPopularListView({super.key, this.products});

  final List<ProductModel>? products;

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> displayList = products ?? mostPopularProducts;
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 24.0, right: 12.0),
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          final ProductModel product = displayList[index];
          return Container(
            width: 165,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(product.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(AppAssets.favoriteSvg,)),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        style: TextStyles.jostBody3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.location ?? '',
                        style: TextStyles.jostBody5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$${product.price ?? 'N/A'} / night',
                            style: TextStyles.jostBody4.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.semantic,
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${product.review ?? 'N/A'}',
                                style: TextStyles.jostBody4.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

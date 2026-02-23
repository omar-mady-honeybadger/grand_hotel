import 'package:flutter/material.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/detail/pages/detail.dart';
import 'package:grand_hotel/features/home/widgets/property_type_selector.dart';
import 'package:grand_hotel/core/widgets/search_button.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: SearchButton(),
            ),
            PropertyTypeSelector(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myFavoriteProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) {
                  final ProductModel product = myFavoriteProducts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: (){
                         pushTo(context, ProductDetailScreen(product: product,));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Hero(
                              tag: product.tag?? '',
                              child: Image.asset(
                                product.image ?? '',
                                width: double.infinity,
                                height: 119,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 11),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.warning,
                                size: 16.0,
                              ),
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
                            ],
                          ),
                          SizedBox(height: 7),
                          Text(
                            product.name ?? '',
                            style: TextStyles.plusJakartaSansBody3,
                          ),
                          Text(
                            product.location ?? '',
                            style: TextStyles.plusJakartaSansBody5.copyWith(
                              color: AppColors.grayScale80,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '\$${product.price ?? 'N/A'}',
                                style: TextStyles.plusJakartaSansBody3,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Per Night',
                                style: TextStyles.plusJakartaSansBody5.copyWith(
                                  color: AppColors.grayScale80,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

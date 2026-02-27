import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/best_today_list_view.dart';
import 'package:grand_hotel/core/widgets/section_header.dart';
import 'package:grand_hotel/features/detail/widgets/booking_now.dart';
import 'package:grand_hotel/features/detail/widgets/custom_detail_image.dart';
import 'package:grand_hotel/features/detail/widgets/detail_app_bar.dart';
import 'package:grand_hotel/features/detail/widgets/hotel_features.dart';
import 'package:grand_hotel/features/detail/widgets/hotel_info.dart';
import 'package:grand_hotel/features/detail/widgets/reviews.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DetailAppBar(scrollController: scrollController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                CustomDetailImage(widget: widget),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HotelInfo(widget: widget),
                              SizedBox(height: 16),
                              SectionHeader(
                                label: 'Common Facilities',
                                textButtonLabel: 'See All',
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  HotelFeatures(
                                    feature: 'AC',
                                    path: AppAssets.acSvg,
                                  ),
                                  HotelFeatures(
                                    feature: 'Restaurant',
                                    path: AppAssets.restaurantSvg,
                                  ),
                                  HotelFeatures(
                                    feature: 'Swimming Pool',
                                    path: AppAssets.swimmingPoolSvg,
                                  ),
                                  HotelFeatures(
                                    feature: '24-Hours Front Desk',
                                    path: AppAssets.hoursSvg,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text('Description', style: TextStyles.jostBody2),
                              SizedBox(height: 10),
                              Text(
                                'The ideal place for those looking for a luxurious and'
                                ' tranquil holiday experience with stunning sea views.',
                                style: TextStyles.plusJakartaSansBody3.copyWith(
                                  color: AppColors.grayScale80,
                                ),
                              ),
                              SizedBox(height: 16),
                              SectionHeader(
                                label: 'Location',
                                textButtonLabel: 'Open Map',
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  AppAssets.locationPng,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Reviews(widget: widget),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 24,
                                left: 24,
                                top: 24,
                                bottom: 16,
                              ),
                              child: SectionHeader(
                                label: 'Recommendation',
                                textButtonLabel: 'See All',
                              ),
                            ),
                            BestTodayListView(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BookingNow(widget: widget, product: widget.product),
    ); // انا هنا خدت المودل ده علاشان هشتغل بيه فى ال chick out screen
  }
}

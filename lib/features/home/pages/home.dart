import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/features/home/widgets/best_today_list_view.dart';
import 'package:grand_hotel/features/home/widgets/most_popular_list_view.dart';
import 'package:grand_hotel/features/home/widgets/section_header.dart';
import 'package:grand_hotel/features/home/widgets/home_app_bar.dart';
import 'package:grand_hotel/features/home/widgets/property_type_selector.dart';
import 'package:grand_hotel/features/home/widgets/recently_viewed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 6.0,
              ),
              child: SectionHeader(
                label: 'Most Popular',
                textButtonLabel: 'See All',
              ),
            ),
            MostPopularListView(),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 2.0,
              ),
              child: SectionHeader(
                label: 'Recommended for you',
                textButtonLabel: 'See All',
              ),
            ),
            PropertyTypeSelector(),
            const SizedBox(height: 16),
            RecentlyViewed(productList: recommendedProducts),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 6.0,
              ),
              child: SectionHeader(
                label: 'Hotel  Near You',
                textButtonLabel: 'Open Map',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(AppAssets.mapPng, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 6.0,
              ),
              child: SectionHeader(
                label: 'Best Today 🔥',
                textButtonLabel: 'See All',
              ),
            ),
            BestTodayListView(),
          ],
        ),
      ),
    );
  }
}

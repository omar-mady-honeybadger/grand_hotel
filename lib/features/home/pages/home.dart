import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/features/home/widgets/best_today_list_view.dart';
import 'package:grand_hotel/features/home/widgets/most_popular_list_view.dart';
import 'package:grand_hotel/features/home/widgets/headline.dart';
import 'package:grand_hotel/features/home/widgets/home_app_bar.dart';
import 'package:grand_hotel/features/home/widgets/recommended_for_you.dart';

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
              child: Headline(
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
              child: Headline(
                label: 'Recommended for you',
                textButtonLabel: 'See All',
              ),
            ),
            RecommendedForYou(),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 6.0,
              ),
              child: Headline(
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
              child: Headline(
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
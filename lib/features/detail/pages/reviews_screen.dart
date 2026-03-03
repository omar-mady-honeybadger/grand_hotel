import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox.expand(
          child: Image.asset(AppAssets.reviewsPng, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class BookingCard extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final double rating;
  final String location;
  final String price;
  final String dates;
  final String guests;
  final VoidCallback? onTap;

  const BookingCard({
    super.key,
    required this.imagePath,
    required this.hotelName,
    required this.rating,
    required this.location,
    required this.price,
    required this.dates,
    required this.guests,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayScale30,
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotelName,
                          style: TextStyles.jostBody2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.semantic,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyles.jostBody3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppColors.grayScale60,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyles.jostBody4.copyWith(
                            color: AppColors.grayScale70,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: TextStyles.jostBody3.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: AppColors.grayScale30),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: AppColors.grayScale60,
                      ),
                      const SizedBox(width: 6),
                      Text(dates, style: TextStyles.jostBody4),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 14,
                        color: AppColors.grayScale60,
                      ),
                      const SizedBox(width: 6),
                      Text(guests, style: TextStyles.jostBody4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
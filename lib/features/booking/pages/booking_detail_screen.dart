import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class BookingDetailScreen extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final double rating;
  final String location;
  final String price;
  final String dates;
  final String guests;

  const BookingDetailScreen({
    super.key,
    required this.imagePath,
    required this.hotelName,
    required this.rating,
    required this.location,
    required this.price,
    required this.dates,
    required this.guests,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Booking Detail", style: TextStyles.jostBody1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.grayScale100),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert, color: AppColors.grayScale100),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Hotel", style: TextStyles.jostBody2),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotelName, style: TextStyles.jostBody2),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                              color: AppColors.grayScale60,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                location,
                                style: TextStyles.jostBody4.copyWith(
                                  color: AppColors.grayScale70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          price,
                          style: TextStyles.jostBody3.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.semantic,
                      ),
                      const SizedBox(height: 4),
                      Text(rating.toString(), style: TextStyles.jostBody3),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text("Location", style: TextStyles.jostBody2),
            const SizedBox(height: 12),

            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/map.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text("Your Booking", style: TextStyles.jostBody2),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _infoRow(Icons.calendar_today, "Dates", dates),
                  const SizedBox(height: 14),
                  _infoRow(Icons.person, "Guest", guests),
                  const SizedBox(height: 14),
                  _infoRow(Icons.meeting_room, "Room type", "Queen Room"),
                  const SizedBox(height: 14),
                  _infoRow(Icons.phone, "Phone", "0214345646"),
                  const SizedBox(height: 20),

                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/parcode.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.grayScale60),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyles.jostBody3.copyWith(color: AppColors.grayScale70),
        ),
        const Spacer(),
        Text(value, style: TextStyles.jostBody3),
      ],
    );
  }
}

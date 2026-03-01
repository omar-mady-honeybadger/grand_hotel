import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import '../widgets/booking_card.dart';
import 'booking_detail_screen.dart';
import 'package:grand_hotel/core/widgets/search_button.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  bool bookedSelected = true;

  final List<Map<String, dynamic>> bookings = [
    {
      "imagePath": "assets/images/cerulean_temple_hotel.jpg",
      "hotelName": "The Aston Vill Hotel",
      "rating": 4.7,
      "location": "Veum Point, Michikoton",
      "price": "\$120 /night",
      "dates": "12 - 14 Nov 2024",
      "guests": "2 Guests (1 Room)",
    },
    {
      "imagePath": "assets/images/elysian_suites.jpg",
      "hotelName": "Mystic Palms",
      "rating": 4.0,
      "location": "Palm Springs, CA",
      "price": "\$230 /night",
      "dates": "20 - 25 Nov 2024",
      "guests": "1 Guest (1 Room)",
    },
    {
      "imagePath": "assets/images/astra_grand_hotel.jpg",
      "hotelName": "Elysian Suites",
      "rating": 3.8,
      "location": "San Diego, CA",
      "price": "\$320 /night",
      "dates": "27 - 28 Nov 2024",
      "guests": "1 Guest (1 Room)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("My Booking", style: TextStyles.jostBody1),
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
        child: Column(
          children: [
            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SearchButton(),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildTab("Booked", true),
                  const SizedBox(width: 16),
                  _buildTab("History", false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ...bookings.map(
              (booking) => BookingCard(
                imagePath: booking["imagePath"],
                hotelName: booking["hotelName"],
                rating: booking["rating"],
                location: booking["location"],
                price: booking["price"],
                dates: booking["dates"],
                guests: booking["guests"],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingDetailScreen(
                        imagePath: booking["imagePath"],
                        hotelName: booking["hotelName"],
                        rating: booking["rating"],
                        location: booking["location"],
                        price: booking["price"],
                        dates: booking["dates"],
                        guests: booking["guests"],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isBookedTab) {
    final isSelected = bookedSelected == isBookedTab;

    return GestureDetector(
      onTap: () {
        setState(() {
          bookedSelected = isBookedTab;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.grayScale30,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyles.jostBody3.copyWith(
            color: isSelected ? AppColors.white : AppColors.grayScale80,
          ),
        ),
      ),
    );
  }
}

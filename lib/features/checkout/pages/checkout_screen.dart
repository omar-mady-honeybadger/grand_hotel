import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

import 'package:grand_hotel/core/widgets/hotel_info_card.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/checkout/pages/success_screen.dart';
import 'package:grand_hotel/features/checkout/widgets/add_debt_card_section.dart';
import 'package:grand_hotel/features/checkout/widgets/booking_info_row.dart';
import 'package:grand_hotel/features/checkout/widgets/payment_method_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Checkout'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                HoteInfoCard(model: widget.product),
                Gap(24),
                Container(
                  padding: EdgeInsets.all(16),
                  height: 362,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Your Booking',
                        style: TextStyles.jostBody3.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(12),
                      BookingInfoRow(
                        imagePath: AppAssets.calendarSvg,
                        lable: 'Dates',
                        value: '12 - 14 Nov 2024',
                      ),
                      Gap(15),
                      BookingInfoRow(
                        imagePath: AppAssets.guestSvg,
                        lable: 'Guest',
                        value: '2 Guests (1 Room)',
                      ),
                      Gap(15),
                      BookingInfoRow(
                        imagePath: AppAssets.roomSvg,
                        lable: 'Room type',
                        value: 'Queen Room',
                      ),
                      Gap(15),
                      BookingInfoRow(
                        imagePath: AppAssets.phoneSvg,
                        lable: 'Phone',
                        value: '0214345646',
                      ),
                      Gap(16),

                      DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.black,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                      ),
                      Gap(16),
                      Text(
                        'Price Details',
                        style: TextStyles.jostBody3.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(15),
                      BookingInfoRow(lable: 'Price', value: '\$139.00'),
                      Gap(15),
                      BookingInfoRow(lable: 'Admin fee', value: '\$2.50'),
                      Gap(15),
                      BookingInfoRow(
                        textStyle: TextStyles.jostBody3.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        lable: 'Total price',
                        value: '\$141.50',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 39, left: 24, right: 24),
            child: MainButton(
              text: 'Select Payment',
              onPress: () async {
                setState(() {
                  isSheetOpen = true;
                });
                await showModalBottomSheet(
                  backgroundColor: AppColors.background,
                  context: context,
                  builder: (contex) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 46,
                        left: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Payment Method',
                                style: TextStyles.jostBody1.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  isSheetOpen = false;
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 25,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(31),
                          PaymentMethodCard(
                            imagePath: AppAssets.mastercardLogoSvg,
                            text: 'Master Card',
                            isSelected: true,
                          ),
                          Gap(15),
                          PaymentMethodCard(
                            imagePath: AppAssets.visaSvg,
                            text: 'Visa',
                            isSelected: false,
                          ),
                          Gap(15),
                          AddDebtCardSection(),
                          Gap(45),
                          Center(
                            child: MainButton(
                              text: 'Confirm and Pay',
                              onPress: () {
                                pushTo(context, SuccessScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                setState(() {
                  isSheetOpen = false;
                });
              },
            ),
          ),
        ),
        if (isSheetOpen)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: AppColors.black.withValues(alpha: 0.3)),
            ),
          ),
      ],
    );
  }
}

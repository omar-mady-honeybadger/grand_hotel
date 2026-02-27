import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/booking/widgets/details_line_widget.dart';
import 'package:grand_hotel/features/booking/widgets/number_of_guests_widget.dart';
import 'package:grand_hotel/features/booking/widgets/payment_method_section.dart';
import 'package:grand_hotel/features/booking/widgets/select_date_section.dart';
import 'package:grand_hotel/features/checkout/pages/checkout_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request to book'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Date', style: TextStyles.jostBody2),
            Gap(16),
            Row(
              children: [
                Expanded(child: SelectDateSection(text: 'Check - In')),
                Gap(10),
                Expanded(child: SelectDateSection(text: 'Check - Out')),
              ],
            ),
            Gap(24),
            NumberOfGuestsWidget(),
            Gap(24),
            Text('Pay With', style: TextStyles.jostBody2),
            Gap(16),
            PaymentMethodSection(),
            Gap(24),
            Text('Payment Details', style: TextStyles.jostBody2),
            Gap(10),
            DetailsLineWidget(title: 'Total : 2 Night', price: 400),
            Gap(10),
            DetailsLineWidget(title: 'Cleaning Fee', price: 5),
            Gap(10),
            DetailsLineWidget(title: 'Service Fee', price: 5),
            Gap(10),
            Divider(height: 20),
            Row(
              children: [
                Text(
                  'Total Payment:',
                  style: TextStyles.jostBody2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  '\$410',
                  style: TextStyles.jostBody2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: MainButton(
          text: 'Checkout',
          onPress: () {
            pushTo(context, CheckoutScreen(product: widget.product));
          },
        ),
      ),
    );
  }
}

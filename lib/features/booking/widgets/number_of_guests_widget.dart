import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class NumberOfGuestsWidget extends StatefulWidget {
  const NumberOfGuestsWidget({
    super.key,
  });

  @override
  State<NumberOfGuestsWidget> createState() => _NumberOfGuestsWidgetState();
}

class _NumberOfGuestsWidgetState extends State<NumberOfGuestsWidget> {
  int numberOfGuests = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Guest', style: TextStyles.jostBody2),
        Spacer(),
        GestureDetector(
          onTap: () {
            if (numberOfGuests > 1) {
              setState(() {
                numberOfGuests--;
              });
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffECF1F6),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                size: 15,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$numberOfGuests',
            style: TextStyles.jostBody1.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              numberOfGuests++;
            });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primary,
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: AppColors.background,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

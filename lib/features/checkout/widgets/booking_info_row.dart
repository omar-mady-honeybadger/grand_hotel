import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class BookingInfoRow extends StatelessWidget {
  const BookingInfoRow({
    super.key,
    required this.lable,
    required this.value,
    this.imagePath,
    this.textStyle,
  });
  final String lable;
  final String? imagePath;
  final String value;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imagePath != null) SvgPicture.asset(imagePath!),
        Gap(10),
        Text(
          lable,
          style:
              textStyle ??
              TextStyles.jostBody3.copyWith(fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Text(
          value,
          style:
              textStyle ??
              TextStyles.jostBody3.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

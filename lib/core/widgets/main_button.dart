import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPress});

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () => onPress(),
      child: Text(text, style: TextStyles.plusJakartaSansBody2.copyWith(color: Colors.white)),
    );
  }
}

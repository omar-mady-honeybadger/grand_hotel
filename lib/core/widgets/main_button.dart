import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPress,
    this.hight,
    this.widht,
    this.textStyle,
  });

  final String text;
  final Function() onPress;
  final double? hight;
  final double? widht;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(widht ?? double.infinity, hight ?? 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () => onPress(),
      child: Text(
        text,
        style:
            textStyle ??
            TextStyles.plusJakartaSansBody2.copyWith(color: Colors.white),
      ),
    );
  }
}

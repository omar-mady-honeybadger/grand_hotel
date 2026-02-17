import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.enabled = true,
  });

  final String label;
  final String hintText;
  final bool enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.jostBody3),
        SizedBox(height: 8,),
        TextFormField(
          keyboardType: keyboardType,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(hintText: hintText, enabled: enabled),
          validator: validator,
          onTap: onTap,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.controller,
  });

  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyles.jostBody3),
        SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility_off_outlined),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            if (widget.validator != null) {
              return widget.validator!(value);
            }
            return null;
          },
          controller: widget.controller,
        ),
      ],
    );
  }
}

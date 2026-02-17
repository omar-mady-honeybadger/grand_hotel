import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/data/product_model.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class PropertyTypeSelector extends StatefulWidget {
  const PropertyTypeSelector({super.key});

  @override
  State<PropertyTypeSelector> createState() => _PropertyTypeSelectorState();
}

class _PropertyTypeSelectorState extends State<PropertyTypeSelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 24.0, right: 18.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isActive = selectedIndex == index;
          var category = categories[index];
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: const EdgeInsets.only(right: 6.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive ? Colors.transparent : AppColors.grayScale30,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (category.icon != null && category.icon!.isNotEmpty) ...[
                    SvgPicture.asset(category.icon ?? ''),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    category.title,
                    style: TextStyles.jostBody3.copyWith(
                      color: isActive ? Colors.white : AppColors.grayScale70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

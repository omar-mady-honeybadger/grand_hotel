import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.focusNode, this.onChanged});

  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      side: WidgetStatePropertyAll(BorderSide(color: AppColors.grayScale30)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      constraints: BoxConstraints(maxHeight: 52, minHeight: 52),
      elevation: WidgetStatePropertyAll(0),
      hintText: "Search...",
      hintStyle: WidgetStatePropertyAll(
        TextStyles.jostBody3.copyWith(color: AppColors.grayScale60),
      ),
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
      trailing: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.filterSvg),
        ),
      ],
    );
  }
}

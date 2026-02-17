import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/home/pages/my_favorite.dart';
import 'package:grand_hotel/features/home/pages/search.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppAssets.userPng),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Matr Kohler', style: TextStyles.plusJakartaSansBody2),
              SizedBox(height: 3),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.locationSvg),
                  SizedBox(width: 4),
                  Text(
                    'San Diego, CA',
                    style: TextStyles.plusJakartaSansBody3.copyWith(
                      color: AppColors.grayScale70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(AppAssets.searchSvg),
          onPressed: () {
            pushTo(context, SearchScreen());
          },
        ),
        IconButton(
          icon: SvgPicture.asset(AppAssets.favoriteSvg),
          onPressed: () {
            pushTo(context, MyFavoriteScreen());
          },
        ),
      ],
    );
  }
}

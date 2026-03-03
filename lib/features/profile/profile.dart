import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/auth/pages/sign_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(AppAssets.userPng),
            ),
            title: Text('Matr Kohler', style: TextStyles.jostBody1),
            subtitle: Text(
              '@Broklyn',
              style: TextStyles.jostBody3.copyWith(
                color: AppColors.grayScale70,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: SvgPicture.asset(AppAssets.editSquareSvg),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0 ,vertical: 5),
                  child: Divider(),
                ),
                ListTile(
                  leading: SvgPicture.asset(AppAssets.workSvg),
                  title: Text('Your Card', style: TextStyles.jostBody2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 5),
                  child: Divider(),
                ),
                ListTile(
                  leading: SvgPicture.asset(AppAssets.shieldDoneSvg),
                  title: Text('Security', style: TextStyles.jostBody2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 5),
                  child: Divider(),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_none_outlined),
                  title: Text('Notification ', style: TextStyles.jostBody2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 5),
                  child: Divider(),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Languages', style: TextStyles.jostBody2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 5),
                  child: Divider(),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline_outlined),
                  title: Text('Help and Support', style: TextStyles.jostBody2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0 ,vertical: 5),
                  child: Divider(),
                ),
                SizedBox(height: 28),
                TextButton(
                  onPressed: () {
                    removeUntil(context, SignInPage());
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyles.jostBody2.copyWith(color: AppColors.error),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/auth_action_row.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/sign_in.dart';
import 'package:grand_hotel/features/auth/pages/sign_up.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundJpg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Image.asset(
            AppAssets.shadowPng,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 57),
                  child: Column(
                    children: [
                      Text(
                        'Discover Your Dream Hotel, Effortlessly',
                        textAlign: TextAlign.center,
                        style: TextStyles.jostH4.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        textAlign: TextAlign.center,
                        style: TextStyles.jostBody3.copyWith(
                          color: AppColors.grayScale30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 32),
                      MainButton(
                        text: 'Get Started',
                        onPress: () {
                          pushTo(context, SignInPage());
                        },
                      ),
                      SizedBox(height: 24),
                      AuthActionRow(
                        onPressed: () {
                          pushTo(context, SignUpPage());
                        },
                        action: 'Register',
                        description: 'Don’t have an account?',
                        descriptionColor: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

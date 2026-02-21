import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/features/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      replaceWith(context, Onboarding());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: SvgPicture.asset(AppAssets.logoSvg)),
    );
  }
}

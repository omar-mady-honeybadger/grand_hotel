import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/features/home/pages/home.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('My Booking Screen')),
    Center(child: Text('Message Screen')),
    Center(child: Text('Profile Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 60,
              offset: Offset(0, -20),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedLabelStyle: TextStyles.jostBody5.copyWith(
            color: AppColors.grayScale70,
          ),
          unselectedLabelStyle: TextStyles.jostBody5.copyWith(
            color: AppColors.primary,
          ),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.homeSvg),
              activeIcon: SvgPicture.asset(AppAssets.homeFilledSvg),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.documentSvg),
              activeIcon: SvgPicture.asset(AppAssets.documentFilledSvg),
              label: 'My Booking',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.chatSvg),
              activeIcon: SvgPicture.asset(AppAssets.chatFilledSvg),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.userSvg),
              activeIcon: SvgPicture.asset(AppAssets.userFilledSvg),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

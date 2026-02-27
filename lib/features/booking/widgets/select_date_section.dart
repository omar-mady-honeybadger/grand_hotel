import 'dart:ui';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grand_hotel/core/constants/app_assets.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:intl/intl.dart';

class SelectDateSection extends StatelessWidget {
  const SelectDateSection({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCustomDatePickerDaialog(context);
      },
      child: Container(
        height: 94,
        width: 158,
        decoration: BoxDecoration(
          color: Color(0xF7F7F7F7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.calendarSvg),
                  Gap(10),
                  Text(
                    text,
                    style: TextStyles.jostBody2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(14),
              Row(
                children: [
                  Text(
                    DateFormat('MMM d,yyyy').format(DateTime.now()),
                    style: TextStyles.jostBody2.copyWith(
                      color: AppColors.grayScale80,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showCustomDatePickerDaialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4 * anim1.value,
          sigmaY: 4 * anim1.value,
        ),
        child: FadeTransition(opacity: anim1, child: child),
      ),

      barrierColor: AppColors.black.withValues(alpha: 0.5),
      pageBuilder: (context, idjfk, ijfijd) => AlertDialog(
        backgroundColor: AppColors.background,

        title: Center(child: Text('Select Date', style: TextStyles.jostBody1)),
        content: SizedBox(
          width: 340,
          height: 300,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2WithActionButtonsConfig(
              calendarType: CalendarDatePicker2Type.single,
              firstDayOfWeek: 6,
              disableMonthPicker: true,
              nextMonthIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: AppColors.black,
              ),
              lastMonthIcon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: AppColors.black,
              ),

              disableModePicker: true,
              centerAlignModePicker: true,
              dayTextStyle: TextStyles.jostBody4.copyWith(
                fontWeight: FontWeight.w500,
              ),
              monthTextStyle: TextStyles.jostBody1,
              controlsTextStyle: TextStyles.jostBody3,
              yearTextStyle: TextStyles.jostBody1,

              weekdayLabelTextStyle: TextStyles.jostBody4.copyWith(
                fontWeight: FontWeight.w500,
              ),

              selectedDayHighlightColor: AppColors.primary,
              selectedDayTextStyle: TextStyles.jostBody4.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            value: [],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyles.jostBody3.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
              ),
            ),
          ),

          MainButton(
            text: 'Apply',
            onPress: () {},
            hight: 42,
            widht: 133,
            textStyle: TextStyles.jostBody3.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

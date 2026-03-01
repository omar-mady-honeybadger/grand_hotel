import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/auth_action_row.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/create_new_password.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';
import 'package:grand_hotel/features/main/main_app_screen.dart';
import 'package:pinput/pinput.dart';

enum OTPSource { registration, forgotPassword }

class EnterOTPPage extends StatefulWidget {
  const EnterOTPPage({super.key, required this.source});

  final OTPSource source;

  @override
  State<EnterOTPPage> createState() => _EnterOTPPageState();
}

class _EnterOTPPageState extends State<EnterOTPPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Headline(
                  label: 'Enter OTP',
                  message:
                      'We have just sent you 4 digit code via your email example@gmail.com',
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyles.jostH4.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.primary),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyles.jostH4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.grayScale60,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty == true) {
                        return 'Please enter the verification code';
                      } else if (value.length < 4) {
                        return 'Please enter a valid verification code';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40),
                MainButton(
                  text: 'Continue',
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      if (formKey.currentState!.validate()) {
                        if (widget.source == OTPSource.registration) {
                          removeUntil(context, const MainAppScreen());
                        } else if (widget.source == OTPSource.forgotPassword) {
                          pushTo(context, const CreateNewPasswordPage());
                        }
                      }
                    }
                  },
                ),
                SizedBox(height: 24),
                AuthActionRow(
                  action: 'Resend Code',
                  description: 'Didn’t receive code?',
                  descriptionColor: AppColors.grayScale80,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

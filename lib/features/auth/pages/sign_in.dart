import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/sign_up.dart';
import 'package:grand_hotel/features/auth/widgets/custom_password_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/custom_text_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';
import 'package:grand_hotel/features/auth/widgets/or_sign_in_with.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isRemembered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Headline(
                label: 'Let\'s Sign you in',
                message: 'Welcome back! You\'ve been missed.',
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                label: 'Email Address',
                hintText: 'Enter your email address',
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Please enter yor email';
                  } else if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomPasswordFormField(
                label: 'Password',
                hintText: 'Enter your password',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _isRemembered,
                      onChanged: (value) {
                        setState(() => _isRemembered = value!);
                      },
                      shape: const CircleBorder(), // Perfect circle
                      side: const BorderSide(
                        color: AppColors.grayScale30,
                        width: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Space between circle and text
                  Text(
                    "Remember Me",
                    style: TextStyles.jostBody3.copyWith(
                      color: AppColors.grayScale70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyles.jostBody3.copyWith(
                        color: AppColors.error,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              MainButton(text: 'Sign In', onPress: () {}),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: TextStyles.jostBody2),
                  SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      replaceWith(context, SignUpPage());
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      'Sign Up',
                      style: TextStyles.jostBody2.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              OrSignInWith(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/style/app_colors.dart';
import 'package:grand_hotel/core/style/text_styles.dart';
import 'package:grand_hotel/core/widgets/auth_action_row.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/forgot_password.dart';
import 'package:grand_hotel/features/auth/pages/sign_up.dart';
import 'package:grand_hotel/features/auth/widgets/custom_password_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/custom_text_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';
import 'package:grand_hotel/features/auth/widgets/or_sign_in_with.dart';
import 'package:grand_hotel/features/home/pages/home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isRemembered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Form(
              key: formKey,
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
                        onPressed: () {
                          pushTo(context, ForgotPasswordPage());
                        },
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
                  MainButton(
                    text: 'Sign In',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        removeUntil(context, HomeScreen());
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  AuthActionRow(
                    action: 'Sign Up',
                    description: 'Don\'t have an account?',
                    descriptionColor: AppColors.grayScale70,
                    onPressed: () {
                      replaceWith(context, SignUpPage());
                    },
                  ),
                  SizedBox(height: 24),
                  OrSignInWith(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

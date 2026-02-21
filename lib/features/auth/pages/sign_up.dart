import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/enter_otp.dart';
import 'package:grand_hotel/features/auth/widgets/custom_password_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/custom_text_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';
import 'package:grand_hotel/features/auth/widgets/or_sign_in_with.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                    label: 'Create Account',
                    message: 'Let\'s get started with creating your account',
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    label: 'Full Name',
                    hintText: 'Enter your name',
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    label: 'Email',
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
                  SizedBox(height: 32),
                  MainButton(
                    text: 'Create An Account',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        pushTo(context, const EnterOTPPage(source: OTPSource.registration));
                      }
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

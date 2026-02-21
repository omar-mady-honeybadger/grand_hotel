import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/pages/enter_otp.dart';
import 'package:grand_hotel/features/auth/widgets/custom_text_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                  label: 'Forgot Password',
                  message: 'Recover your account password',
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  label: 'E-mail',
                  hintText: 'Enter your email',
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
                SizedBox(height: 40),
                MainButton(text: 'Next', onPress: () {
                  if (formKey.currentState!.validate()) {
                          pushTo(context, const EnterOTPPage(source: OTPSource.forgotPassword));
                        }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

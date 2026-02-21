import 'package:flutter/material.dart';
import 'package:grand_hotel/core/functions/navigations.dart';
import 'package:grand_hotel/core/functions/show_snackbar.dart';
import 'package:grand_hotel/core/widgets/main_button.dart';
import 'package:grand_hotel/features/auth/widgets/custom_password_form_field.dart';
import 'package:grand_hotel/features/auth/widgets/headline.dart';
import 'package:grand_hotel/features/home/pages/home.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                    label: 'Create a New Password',
                    message: 'Enter your new password',
                  ),
                  SizedBox(height: 34),
                  CustomPasswordFormField(
                    controller: _passwordController,
                    label: 'New Password',
                    hintText: 'Enter your password',
                  ),
                  SizedBox(height: 24),
                  CustomPasswordFormField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hintText: 'Confirm your password',
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  MainButton(
                    text: 'Next',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        showSuccessSnackBar(
                          context,
                          'Password Changed Successfully',
                        );
                        removeUntil(context, HomeScreen());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        // Go to Home after signup
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryRed, AppColors.background],
            stops: [0.0, 0.4],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Header (Create Your Account)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create Your\nAccount",
                    style: AppTypography.headlineLarge,
                  ),
                ),
                const SizedBox(height: 30),

                // White Card
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Full Name",
                          hint: "Jhon Doe",
                          validator: (v) => v!.isEmpty ? "Name required" : null,
                          suffixIcon: Icons.check,
                        ),
                        CustomTextField(
                          label: "Phone or Gmail",
                          hint: "jhondoe@gmail.com",
                          validator: (v) =>
                              v!.isEmpty ? "Contact info required" : null,
                          suffixIcon: Icons.check,
                        ),
                        CustomTextField(
                          label: "Password",
                          hint: "********",
                          obscureText: true,
                          suffixIcon: Icons.visibility_off_outlined,
                        ),
                        CustomTextField(
                          label: "Confirm Password",
                          hint: "********",
                          obscureText: true,
                          suffixIcon: Icons.visibility_off_outlined,
                          validator: (v) =>
                              v!.isEmpty ? "Confirm password" : null,
                        ),
                        const SizedBox(height: 20),

                        PrimaryButton(
                          text: "SIGN UP",
                          isLoading: _isLoading,
                          onPressed: _handleSignup,
                        ),

                        const SizedBox(height: 20),

                        // Back to Login Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppTypography.bodySmall,
                            ), // Note: Image says "Don't have account? Sign in" which is a typo in image, usually "Already have account"
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pop(context), // Go back to Login
                              child: Text(
                                "Sign in",
                                style: AppTypography.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

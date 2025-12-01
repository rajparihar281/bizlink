import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Key for form validation
  final _formKey = GlobalKey<FormState>();

  // State variables
  bool _isLoading = false;
  final bool _obscurePassword = true;

  void _handleLogin() async {
    // 1. Validate inputs
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // 2. Simulate API call (Day 1-2 requirement)
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        // 3. Navigate to Home on success
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // Gradient Background from "Music Show" Theme
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Header Section ---
                Text("BizLink", style: AppTypography.headlineLarge),
                const SizedBox(height: 10),
                Text("Welcome Back", style: AppTypography.headlineMedium),
                const SizedBox(height: 40),

                // --- Login Card ---
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
                        // 1. Email Field
                        CustomTextField(
                          label: "Email",
                          hint: "Enter your email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!value.contains('@')) {
                              return "Invalid email format";
                            }
                            return null;
                          },
                          suffixIcon: Icons.check, // Visual cue from design
                        ),

                        // 2. Password Field
                        StatefulBuilder(
                          builder: (context, setState) {
                            return CustomTextField(
                              label: "Password",
                              hint: "Enter password",
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return "Password too short";
                                }
                                return null;
                              },
                              // Toggle Visibility Logic
                              suffixIcon: _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            );
                          },
                        ),

                        // 3. Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Placeholder for Forgot Password logic
                            },
                            child: Text(
                              "Forgot Password?",
                              style: AppTypography.bodySmall.copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // 4. Gradient Sign In Button
                        PrimaryButton(
                          text: "SIGN IN",
                          isLoading: _isLoading,
                          onPressed: _handleLogin,
                        ),

                        const SizedBox(height: 20),

                        // 5. Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: AppTypography.bodySmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the Signup Screen
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                "Sign up",
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

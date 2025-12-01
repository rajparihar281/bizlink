import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../services/api/api_service.dart'; 
import '../../utils/error_handler.dart';
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
  final ApiService _apiService = ApiService();
  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Real API Call
        // Note: You need to get text from controllers, assuming you add TextEditingControllers
        // For this example, I'll use hardcoded or values you'd extract from controllers
        bool success = await _apiService.login(
          "test@gmail.com", // Replace with _emailController.text
          "12345678", // Replace with _passwordController.text
        );

        if (success && mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } catch (e) {
        if (mounted) ErrorHandler.showError(context, e.toString());
      } finally {
        if (mounted) setState(() => _isLoading = false);
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

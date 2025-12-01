import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart'; // Imports your defined colors

class AppTypography {
  // 1. Large Headers (e.g., "Hello Sign in!", "Create Your Account")
  // Used on the dark gradient backgrounds
  static TextStyle get headlineLarge => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.2,
  );

  // 2. Sub-headers (e.g., "Welcome Back")
  static TextStyle get headlineMedium => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  // 3. Input Field Labels (e.g., "Email", "Password")
  // Usually appears on white cards, so default color is dark
  static TextStyle get inputLabel => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  // 4. Input Field Text (What the user types)
  static TextStyle get inputText => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  // 5. Buttons (e.g., "SIGN IN", "SIGN UP")
  static TextStyle get buttonText => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.0, // Slight spacing for uppercase look
  );

  // 6. Secondary Links (e.g., "Forgot Password?", "Don't have account?")
  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.grey.shade600,
  );

  // 7. General Body Text (Feed posts, descriptions)
  static TextStyle get bodyRegular => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary, // White by default for dark theme background
  );
}

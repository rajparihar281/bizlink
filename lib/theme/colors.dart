import 'package:flutter/material.dart';

class AppColors {
  // Extracted from the "Music Show" Image
  static const Color background = Color(0xFF0F0507); // Deep dark base
  static const Color primaryRed = Color(0xFFC21038); // Main button red
  static const Color darkRed = Color(0xFF63081C); // Gradient end
  static const Color inputField = Color(0xFFF5F5F5); // White/Light inputs
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;

  // Gradient for Buttons/Backgrounds
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryRed, darkRed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
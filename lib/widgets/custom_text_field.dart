import 'package:flutter/material.dart';
import '../theme/typography.dart';
import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.inputLabel),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          style: AppTypography.inputText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey, size: 20)
                : null,
            // Underline style matching the "Music Show" image
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryRed),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

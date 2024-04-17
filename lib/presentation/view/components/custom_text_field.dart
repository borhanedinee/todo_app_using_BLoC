import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;

  final Widget? suffixIcon;

  final String? hint;

  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.passwordController,
    required this.validator,
    required this.suffixIcon,
    required this.hint,
    required this.prefixIcon,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        validator: validator,
        controller: passwordController,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          hintText: hint,
          filled: true,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
          fillColor: Colors.grey.shade800,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

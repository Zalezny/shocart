import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({super.key, required this.text, this.validator, required this.controller, this.obscureText, this.suffixIcon});

  final String text;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: text,
          border: const OutlineInputBorder(),
        ),
        maxLines: 1,
      ),
    );
  }
}

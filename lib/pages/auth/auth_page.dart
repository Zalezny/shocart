import 'package:flutter/material.dart';

import 'widgets/auth_text_form_field.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  final bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              Image.asset(
                'assets/images/stocart_logo.png',
                height: 128,
              ),
              const AuthTextFormField(text: 'Email'),
              const AuthTextFormField(text: 'Password'),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: ElevatedButton(
                    onPressed: isValidate ? () {} : null,
                    child: const Text('Sign in'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

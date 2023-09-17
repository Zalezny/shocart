import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shocart/bloc/auth_form_cubit/auth_form_cubit.dart';

import 'widgets/auth_text_form_field.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthFormCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    'assets/images/stocart_logo.png',
                    height: 128,
                  ),
                  AuthTextFormField(
                    text: 'Email',
                    controller: _emailController,
                    validator: (email) {
                      if (authCubit.isValidEmail(email!)) {
                        return null;
                      }
                      return authCubit.state.emailError;
                    },
                  ),
                  AuthTextFormField(
                    controller: _passwordController,
                    text: 'Password',
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: ElevatedButton(
                        onPressed: _validateForm,
                        child: const Text('Sign in'),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {}
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shocart/bloc/auth_cubit/auth_cubit.dart';
import 'package:shocart/bloc/auth_form_cubit/auth_form_cubit.dart';

import 'widgets/auth_text_form_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  bool _visiblePassword = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authFormCubit = context.read<AuthFormCubit>();

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
                      if (authFormCubit.isValidEmail(email!)) {
                        return null;
                      }
                      return authFormCubit.state.emailError;
                    },
                  ),
                  AuthTextFormField(
                    controller: _passwordController,
                    text: 'Password',
                    obscureText: !_visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _visiblePassword = !_visiblePassword;
                      }),
                      icon: Icon(
                        _visiblePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: ElevatedButton(
                      onPressed: () => _validateForm(context),
                      child: const Text('Sign in'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm(context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final result = await context.read<AuthCubit>().signIn(_emailController.text, _passwordController.text);
      final snackBarText = result ? "Logged In" : "Sorry, but account probably doesnt exist";
      final snackBar = SnackBar(content: Text(snackBarText));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

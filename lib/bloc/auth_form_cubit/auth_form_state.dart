part of 'auth_form_cubit.dart';

class AuthFormState {
  AuthFormState({
    this.email = '',
    this.emailError = '',
    this.isEmailValid = false,
    this.password = '',
    this.passwordError = '',
    this.isPasswordValid = false,
  });

  final String email;
  final String emailError;
  final bool? isEmailValid;
  final String password;
  final String passwordError;
  final bool? isPasswordValid;

  AuthFormState copyWith({
    String? email,
    String? emailError,
    bool? isEmailValid,
    String? password,
    String? passwordError,
    bool? isPasswordValid,
  }) {
    return AuthFormState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ??  this.password,
      passwordError: passwordError ?? this.passwordError,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}

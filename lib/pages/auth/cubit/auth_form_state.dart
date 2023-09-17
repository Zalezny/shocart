part of 'auth_form_cubit.dart';

class AuthFormState {
  AuthFormState({
    this.email = '',
    this.emailError = '',
    this.isEmailValid = false,
  });

  final String email;
  final String emailError;
  final bool? isEmailValid;

  AuthFormState copyWith({
    String? email,
    String? emailError,
    bool? isEmailValid,
  }) {
    return AuthFormState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      isEmailValid: isEmailValid ?? this.isEmailValid,
    );
  }
}

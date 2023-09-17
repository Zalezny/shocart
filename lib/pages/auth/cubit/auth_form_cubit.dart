import 'package:bloc/bloc.dart';

part 'auth_form_state.dart';

class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit() : super(AuthFormState());

  bool isValidEmail(String value) {
    bool isValid = _isEmailValid(value);
    String error = isValid ? "" : "Invalid email address";
    emit(state.copyWith(email: value, isEmailValid: isValid, emailError: error));

    return isValid;
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

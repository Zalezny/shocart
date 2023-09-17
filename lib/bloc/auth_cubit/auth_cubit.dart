import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shocart/data/auth_repo_impl.dart';
import 'package:shocart/di/injectable.dart';
import 'package:shocart/repository/auth_repo.dart';
import 'package:shocart/utils/result.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  final AuthRepo authRepo = getIt<AuthRepoImpl>();

  User? getUser() {
    final user = authRepo.getCurrentUser();
    emit(AuthState(user: user));
    return user;
  }

  Future<Result<String, Exception>> signIn(String email, String password) async {
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    if (result is Success) {
      final User user = (result as Success).value;
      emit(AuthState(user: user));
      return Success(user.uid);
    }

    return Failure((result as Failure).exception);
  }
}

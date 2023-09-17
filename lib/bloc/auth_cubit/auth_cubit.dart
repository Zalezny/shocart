import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shocart/data/auth_repo_impl.dart';
import 'package:shocart/repository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  final AuthRepo authRepo = AuthRepoImpl();

  User? getUser() {
    final user = authRepo.getCurrentUser();
    emit(AuthState(user: user));
    return user;
  }
}

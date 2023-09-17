import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shocart/di/injectable.dart';
import 'package:shocart/repository/auth_repo.dart';
import 'package:shocart/utils/result.dart';

@lazySingleton
class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();
  @override
  User? getCurrentUser() => firebaseAuth.currentUser;

  @override
  Future<Result<User, Exception>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        return Success(user);
      }
      return Failure(Exception('Not found user'));
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}

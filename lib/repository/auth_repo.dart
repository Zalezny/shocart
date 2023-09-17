import 'package:firebase_auth/firebase_auth.dart';
import 'package:shocart/utils/result.dart';

abstract interface class AuthRepo {
  User? getCurrentUser();
  Future<Result<User, Exception>> signInWithEmailAndPassword(String email, String password);
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shocart/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  User? getCurrentUser() => FirebaseAuth.instance.currentUser;
}

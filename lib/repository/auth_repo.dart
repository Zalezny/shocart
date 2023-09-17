import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepo {
  User? getCurrentUser();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shocart/di/injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.init();
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shocart/di/injectable.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shocart/pages/auth/auth_page.dart';
import 'package:shocart/pages/auth/cubit/auth_form_cubit.dart';
import 'package:shocart/pages/creator/creator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return result != null
        ? const CreatorPage()
        : BlocProvider(
            create: (context) => AuthFormCubit(),
            child: AuthPage(),
          );
  }
}

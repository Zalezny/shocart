import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shocart/bloc/auth_cubit/auth_cubit.dart';
import 'package:shocart/bloc/auth_form_cubit/auth_form_cubit.dart';
import 'package:shocart/presentation/auth/auth_page.dart';
import 'package:shocart/presentation/creator/creator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().getUser();
    return context.read<AuthCubit>().state.user != null
        ? CreatorPage()
        : BlocProvider(
            create: (context) => AuthFormCubit(),
            child: const AuthPage(),
          );
  }
}

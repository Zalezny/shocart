import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shocart/bloc/auth_cubit/auth_cubit.dart';

import 'presentation/home/home_page.dart';
import 'res/theme/default_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shocart',
      theme: defaultTheme,
      home: BlocProvider(
        create: (context) => AuthCubit(),
        child: const HomePage(),
      ),
    );
  }
}

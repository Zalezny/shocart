import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme/default_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shocart',
      theme: defaultTheme,
      home: const HomePage(),
    );
  }
}

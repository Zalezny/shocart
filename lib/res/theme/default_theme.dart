import 'package:flutter/material.dart';
import 'package:shocart/res/colors/app_colors.dart';

const black = Colors.black87;

ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.o_500,
    primary: AppColors.o_500,
    secondary: black,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 21,
      color: black,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: black,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      color: black,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      color: black,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: black,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      color: black,
      fontWeight: FontWeight.w400,
    ),
  ),
);

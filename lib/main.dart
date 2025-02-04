import 'package:flutter/material.dart';
import 'package:funtoo/pages/home.dart'; // Ensure this imports your homepage file
import 'package:funtoo/utils/constants.dart';

void main() {
  runApp(const FuntooApp());
}

class FuntooApp extends StatelessWidget {
  const FuntooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funtoo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.cardColor,
          foregroundColor: AppColors.primaryColor,
          elevation: 1,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textColor),
          bodyMedium: TextStyle(color: AppColors.subtitleColor),
        ),
      ),
      home: const FuntooHomePage(
          userName: 'Your Name',
          userId: 'YourID'), // Provide userName and userId
    );
  }
}

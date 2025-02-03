import 'package:flutter/material.dart';
import 'package:funtoo/pages/home.dart'; // Ensure this imports your homepage file

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
        primaryColor: const Color(0xFF6A1B9A), // Funtoo purple
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6A1B9A),
          secondary: Color(0xFF00BFA5), // Funtoo teal
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF6A1B9A),
          elevation: 0,
        ),
      ),
      home: const FuntooHomePage(), // Matches your home.dart class name
    );
  }
}
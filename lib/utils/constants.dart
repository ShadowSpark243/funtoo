import 'package:flutter/material.dart';

// Primary colors used in the app
const Color primaryColor = Color(0xFF6200EE);
const Color secondaryColor = Color(0xFF03DAC5);
// Define primary and secondary colors
class AppColors {
  static const primaryColor = Color(0xFF6200EE); // Primary Color
  static const secondaryColor = Color(0xFF03DAC5); // Secondary Color
  
  // Updated neutral colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light grey background
  static const Color cardColor = Color(0xFFFFFFFF); // White for cards
  static const Color textColor = Color(0xFF333333); // Dark grey for text
  static const Color subtitleColor = Color(0xFF777777); // Medium grey for subtitles
  
  // Additional Colors
  static const primaryPurple = Color(0xFF6A1B9A);
  static const accentTeal = Color(0xFF00BFA5);
}

// Other constants like text styles, sizes, etc.
const double defaultPadding = 16.0;
const TextStyle defaultTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);



// Define text styles
class AppTextStyles {
  static const defaultTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);  // Default Text Style
  
  static const header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple,
  );
  
  static const sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
}


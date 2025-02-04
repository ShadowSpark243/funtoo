import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/profile_setup_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/home.dart';
import 'pages/profile_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/notification_page.dart';
import 'pages/settings_page.dart';
import 'pages/chat_page.dart';
import 'pages/group_chat_page.dart';
import 'pages/new_chat_page.dart';
import 'pages/new_group_chat_page.dart';
import 'package:funtoo/utils/constants.dart';

void main() {
  runApp(FuntooApp());
}

class FuntooApp extends StatelessWidget {
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
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/profile-setup': (context) => ProfileSetupPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/home': (context) =>
            FuntooHomePage(userName: 'User Name', userId: 'User ID'),
        '/profile': (context) => ProfilePage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/notifications': (context) => NotificationPage(),
        '/settings': (context) => SettingsPage(),
        '/chat': (context) => ChatPage(
            friendName: ModalRoute.of(context)!.settings.arguments as String),
        '/group-chat': (context) => GroupChatPage(
            groupName: ModalRoute.of(context)!.settings.arguments as String),
        '/new-chat': (context) => NewChatPage(),
        '/new-group-chat': (context) => NewGroupChatPage(),
      },
    );
  }
}

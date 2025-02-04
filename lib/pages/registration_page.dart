// lib/pages/registration_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Register',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration Form Here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/profile-setup'); // Navigate to Profile Setup Page
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

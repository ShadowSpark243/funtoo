import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Form Here'),
            ElevatedButton(
              onPressed: () {
                // After successful login
                Navigator.pushNamed(context, '/home'); // Navigate to Home Page
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context,
                    '/forgot-password'); // Navigate to Forgot Password Page
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

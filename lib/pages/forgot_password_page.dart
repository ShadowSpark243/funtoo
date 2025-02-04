import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forgot Password',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reset Password Form Here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login'); // Navigate back to Login Page
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

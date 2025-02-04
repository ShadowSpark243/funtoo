import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class ProfileSetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile Setup',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Setup Form Here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Navigate to Home Page
              },
              child: Text('Complete Setup'),
            ),
          ],
        ),
      ),
    );
  }
}

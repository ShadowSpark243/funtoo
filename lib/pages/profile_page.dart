import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/settings'); // Navigate to Settings Page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Profile Details Here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/edit-profile'); // Navigate to Edit Profile Page
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

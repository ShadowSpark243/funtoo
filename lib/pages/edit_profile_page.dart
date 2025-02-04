import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Edit Profile Form Here'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Profile Page
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

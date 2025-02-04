import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Notifications', style: TextStyle(color: AppColors.textColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Text(
          'No new notifications',
          style: TextStyle(color: AppColors.subtitleColor, fontSize: 18),
        ),
      ),
    );
  }
}

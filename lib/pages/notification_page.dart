import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
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

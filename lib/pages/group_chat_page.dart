import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class GroupChatPage extends StatelessWidget {
  final String groupName; // This will receive the group name

  GroupChatPage({Key? key, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Group Chat: $groupName',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Group chat messages will appear here.'),
            // Add your group chat message list and input field here
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class ChatPage extends StatelessWidget {
  final String friendName; // This will receive the friend's name

  ChatPage({Key? key, required this.friendName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chat with $friendName',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat messages will appear here.'),
            // Add your chat message list and input field here
          ],
        ),
      ),
    );
  }
}

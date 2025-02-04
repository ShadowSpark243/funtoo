import 'package:flutter/material.dart';
import 'chat_page.dart'; // Import the ChatPage
import '../widgets/custom_app_bar.dart'; // Import the custom app bar

class NewChatPage extends StatelessWidget {
  final List<String> friends = [
    'Alice',
    'Bob',
    'Charlie'
  ]; // Sample friends list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Chat',
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friends[index]),
            onTap: () {
              // Navigate to chat page with the selected friend
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(friendName: friends[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

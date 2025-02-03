import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final VoidCallback onLongPress;

  const ChatItem({
    Key? key,
    required this.name,
    required this.subtitle,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(subtitle),
      onLongPress: onLongPress,
      trailing: Icon(Icons.phone),
    );
  }
}

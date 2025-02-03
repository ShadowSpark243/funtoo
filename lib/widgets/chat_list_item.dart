import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final VoidCallback onTap;

  const ChatListItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      child: ListTile(
        title: Text(name, style: TextStyle(color: AppColors.textColor)),
        subtitle: Text(lastMessage, style: TextStyle(color: AppColors.subtitleColor)),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class FriendRequestItem extends StatelessWidget {
  final String name;
  final String username;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const FriendRequestItem({
    Key? key,
    required this.name,
    required this.username,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      child: ListTile(
        title: Text(name, style: TextStyle(color: AppColors.textColor)),
        subtitle: Text(username, style: TextStyle(color: AppColors.subtitleColor)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.check, color: Colors.green), onPressed: onAccept),
            IconButton(icon: Icon(Icons.close, color: Colors.red), onPressed: onDecline),
          ],
        ),
      ),
    );
  }
}

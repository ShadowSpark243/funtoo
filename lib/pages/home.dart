import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/friend_request.dart';
import '../models/group_request.dart';
import '../utils/constants.dart';
import '../widgets/chat_item.dart';
import '../widgets/call_controls.dart';

class FuntooHomePage extends StatefulWidget {
  const FuntooHomePage({super.key});

  @override
  State<FuntooHomePage> createState() => _FuntooHomePageState();
}

class _FuntooHomePageState extends State<FuntooHomePage> {
  final String userId = "FUNTOO#1234";
  final List<FriendRequest> friendRequests = [
    FriendRequest(name: 'Alice', username: '@alice92'),
    FriendRequest(name: 'Bob', username: '@bobmarine'),
  ];
  final List<GroupRequest> groupRequests = [
    GroupRequest(groupName: 'Flutter Devs', members: 5),
    GroupRequest(groupName: 'Gaming Squad', members: 8),
  ];
  final List<FriendRequest> acceptedFriends = [];
  final List<GroupRequest> joinedGroups = [];
  bool isCalling = false;

  void _startCall(BuildContext context, String contact) {
    setState(() {
      isCalling = true;
    });
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) => CallControls(
        contact: contact,
        onEndCall: () => setState(() => isCalling = false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funtoo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            Text(
              'ID: $userId',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Iconsax.user_add), onPressed: _showFriendRequests),
          IconButton(icon: Icon(Iconsax.people), onPressed: _showGroupRequests),
          IconButton(icon: Icon(Iconsax.notification), onPressed: () {}),
        ],
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _buildSectionHeader('Friends'),
            if (acceptedFriends.isEmpty) _buildEmptyState('No friends yet!'),
            ...acceptedFriends.map((friend) => ChatItem(
                  name: friend.name,
                  subtitle: friend.username,
                  onLongPress: () => _startCall(context, friend.name),
                )),
            _buildSectionHeader('Groups'),
            if (joinedGroups.isEmpty) _buildEmptyState('No groups joined yet!'),
            ...joinedGroups.map((group) => ChatItem(
                  name: group.groupName,
                  subtitle: '${group.members} Members',
                  onLongPress: () => _startCall(context, group.groupName),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Iconsax.microphone),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  void _showFriendRequests() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildRequestSheet(friendRequests, (request) {
        setState(() {
          acceptedFriends.add(request);
          friendRequests.remove(request);
        });
      }),
    );
  }

  void _showGroupRequests() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildRequestSheet(groupRequests, (request) {
        setState(() {
          joinedGroups.add(request);
          groupRequests.remove(request);
        });
      }),
    );
  }

  Widget _buildRequestSheet<T>(List<T> requests, Function(T) accept) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                return ListTile(
                  title: Text(request is FriendRequest ? request.name : (request as GroupRequest).groupName),
                  subtitle: Text(request is FriendRequest ? request.username : '${(request as GroupRequest).members} Members'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.check, color: Colors.green), onPressed: () => accept(request)),
                      IconButton(icon: Icon(Icons.close, color: Colors.red), onPressed: () {}),
                      IconButton(icon: Icon(Icons.block, color: Colors.orange), onPressed: () {}),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

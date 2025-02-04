import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/friend_request.dart';
import '../models/group_request.dart';
import '../utils/constants.dart';
import '../widgets/chat_item.dart';
import '../widgets/call_controls.dart';
import 'notification_page.dart';

class FuntooHomePage extends StatefulWidget {
  const FuntooHomePage(
      {super.key, required this.userName, required this.userId});

  final String userName;
  final String userId;

  @override
  State<FuntooHomePage> createState() => _FuntooHomePageState();
}

class _FuntooHomePageState extends State<FuntooHomePage> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ID: ${widget.userId}',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Iconsax.user_add, color: Colors.white),
                        onPressed: _showFriendRequests,
                      ),
                      IconButton(
                        icon: Icon(Iconsax.people, color: Colors.white),
                        onPressed: _showGroupRequests,
                      ),
                      IconButton(
                        icon: Icon(Iconsax.notification, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
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
                  title: Text(request is FriendRequest
                      ? request.name
                      : (request as GroupRequest).groupName),
                  subtitle: Text(request is FriendRequest
                      ? request.username
                      : '${(request as GroupRequest).members} Members'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(Icons.check, color: Colors.green),
                          onPressed: () => accept(request)),
                      IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.block, color: Colors.orange),
                          onPressed: () {}),
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

import 'package:flutter/material.dart';

class CallControls extends StatelessWidget {
  final String contact;
  final VoidCallback onEndCall;

  const CallControls({
    super.key,  // Use super.key here
    required this.contact,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Call with $contact',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.mic_off), onPressed: () {}),
            IconButton(icon: Icon(Icons.call_end), onPressed: onEndCall),
          ],
        ),
      ],
    );
  }
}

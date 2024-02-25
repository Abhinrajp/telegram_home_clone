import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  ChatScreen({super.key, required this.name}) {
    super.key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(10, 8, 8, 8),
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/userimage2.png'),
              backgroundColor: Colors.white,
              radius: 50),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 211, 207, 207),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 3, 10, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.grey,
                    ),
                    // suffixIcon: Icon(Icons.send),
                    hintText: 'Message',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

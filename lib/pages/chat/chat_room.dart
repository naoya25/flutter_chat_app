import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatRoom extends StatefulWidget {
  const ChatRoom(this.name, {super.key});

  final String name;
  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    _getMessages();
    super.initState();
  }

  void _getMessages() async {
    final getData = await FirebaseFirestore.instance
        .collection('chat_room')
        .doc(widget.name)
        .collection('contents')
        .orderBy('createdAt', descending: true)
        .get();

    final message = getData.docs
        .map((d) => types.TextMessage(
            author:
                types.User(id: d.data()['uid'], firstName: d.data()['name']),
            createdAt: d.data()['createdAt'],
            id: d.data()['id'],
            text: d.data()['text']))
        .toList();

    setState(() {
      _messages = [...message];
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("チャットルーム"),
        ),
        body: Chat(
          user: _user,
          messages: _messages,
          onSendPressed: _handleSendPressed,
        ),
      );

  void _addMessage(types.TextMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });

    await FirebaseFirestore.instance
        .collection('chat_room')
        .doc(widget.name)
        .collection('contents')
        .add({
      'uid': message.author.id,
      'name': message.author.firstName,
      'createdAt': message.createdAt,
      'id': message.id,
      'text': message.text,
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }
}

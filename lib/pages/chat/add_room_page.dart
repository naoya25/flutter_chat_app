import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRoomPage extends StatefulWidget {
  const AddRoomPage({super.key});

  @override
  AddPostPageState createState() => AddPostPageState();
}

class AddPostPageState extends State<AddRoomPage> {
  String roomName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ルーム作成'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'チャットルーム名'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onChanged: (String value) {
                  setState(() {
                    roomName = value;
                  });
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('新規作成'),
                  onPressed: () async {
                    final date = DateTime.now().toLocal().toIso8601String();

                    await FirebaseFirestore.instance
                        .collection('chat_room')
                        .doc(roomName)
                        .set({
                      'name': roomName,
                      'createdAt': date,
                    });
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

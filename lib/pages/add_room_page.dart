import 'package:flutter/material.dart';

class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規チャットを始める'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'チャットルーム名'),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onChanged: (String value) {},
            ),
            const Text('追加'),
          ],
        ),
      ),
    );
  }
}

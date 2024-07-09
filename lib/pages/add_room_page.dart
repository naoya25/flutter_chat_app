import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/components/add_room_text_field.dart';
import 'package:my_chat_app/providers/chat_rooms.dart';

class AddRoomPage extends ConsumerWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規チャットを始める'),
      ),
      body: Center(
        child: Column(
          children: [
            AddRoomTextField(
              onSubmit: (String roomName) async {
                final notifier = ref.read(chatRoomsNotifierProvider.notifier);
                await notifier.postChatRoom(roomName);
                if (!context.mounted) return;
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

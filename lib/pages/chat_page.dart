import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/models/room_model.dart';
import 'package:my_chat_app/providers/chats.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends ConsumerWidget {
  const ChatPage(this.room, {super.key});
  final RoomModel room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatsNotifierProvider(room.id));
    final chatsNotifier = ref.watch(chatsNotifierProvider(room.id).notifier);
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) {
      return const Center(
        child: Text('ユーザ情報を取得できませんでした'),
      );
    }
    final user = types.User(
      id: currentUser.id,
      firstName: currentUser.name,
    );
    final title = room.members
        .firstWhere(
          (member) => member.userId == currentUser.id,
        )
        .title;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: chats.when(
        data: (data) {
          return Chat(
            messages: data,
            onSendPressed: (types.PartialText message) {
              chatsNotifier.postMessage(message, room.id, user);
            },
            user: user,
            showUserNames: true,
          );
        },
        loading: loadingWidget,
        error: errorWidget,
      )),
    );
  }
}

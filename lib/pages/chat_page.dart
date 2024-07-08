import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/providers/chats.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends ConsumerWidget {
  const ChatPage(this.roomName, {super.key});
  final String roomName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(chatsNotifierProvider(roomName));
    final chatsNotifier = ref.watch(chatsNotifierProvider(roomName).notifier);
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) {
      return const Center(
        child: Text('ユーザ情報を取得できませんでした'),
      );
    }
    final user = types.User(
      id: currentUser.uid,
      firstName: currentUser.displayName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
      ),
      body: Center(
          child: chats.when(
        data: (data) {
          return Chat(
            messages: data,
            onSendPressed: (types.PartialText message) {
              chatsNotifier.postMessage(message, roomName, user);
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

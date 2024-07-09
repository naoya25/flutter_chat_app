import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/providers/all_users.dart';
import 'package:my_chat_app/providers/chat_rooms.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';

class AddRoomPage extends ConsumerWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) {
      return const Center(
        child: Text('ユーザが見つかりません'),
      );
    }
    final users = ref.watch(allUsersNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: users.when(
                data: (data) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final user = data[index];
                      if (user.id == currentUser.id) {
                        return const SizedBox(height: 0);
                      }

                      return GestureDetector(
                        onTap: () {
                          final notifier =
                              ref.read(chatRoomsNotifierProvider.notifier);
                          notifier.postChatRoom(
                            currentUser,
                            user,
                          );
                          showSnackbar(context, '正常に作成されました');
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(user.email),
                          ),
                        ),
                      );
                    },
                  );
                },
                error: errorWidget,
                loading: loadingWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}

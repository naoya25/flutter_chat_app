import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/components/logout_button.dart';
import 'package:my_chat_app/pages/chat_page.dart';
import 'package:my_chat_app/providers/all_users.dart';
import 'package:my_chat_app/providers/chat_rooms.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    if (currentUser == null) {
      return const Center(
        child: Text('ユーザが見つかりません'),
      );
    }
    final rooms = ref.watch(chatRoomsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [LogoutButton()],
      ),
      body: Center(
        child: Column(
          children: [
            Text('ログイン中: ${currentUser.email}'),
            Expanded(
              child: rooms.when(
                data: (data) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      final notifire =
                          ref.read(allUsersNotifierProvider.notifier);
                      await notifire.refreshState();
                    },
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final room = data[index];
                        final title = room.members
                            .firstWhere(
                              (member) => member.userId == currentUser.id,
                            )
                            .title;
                        return GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChatPage(room);
                                },
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(title),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                error: errorWidget,
                loading: loadingWidget,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push('/add_room');
        },
      ),
    );
  }
}

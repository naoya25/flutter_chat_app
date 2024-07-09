import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/pages/chat_page.dart';
import 'package:my_chat_app/providers/all_users.dart';
import 'package:my_chat_app/providers/chat_rooms.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/repositories/auth_service.dart';
import 'package:my_chat_app/utils/error.dart';
import 'package:my_chat_app/utils/loading.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    // final users = ref.watch(allUsersNotifierProvider);
    final rooms = ref.watch(chatRoomsNotifierProvider);

    String email = currentUser == null || currentUser.email == null
        ? '---'
        : currentUser.email!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              final service = AuthService();
              await service.signOut().catchError(
                (e) {
                  showSnackbar(context, 'ログアウトに失敗しました: $e');
                },
              );
              if (!context.mounted) return;
              showSnackbar(context, 'ログアウトしました');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('ログイン中: $email'),
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
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final room = data[index];
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
                              title: Text(room.name),
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

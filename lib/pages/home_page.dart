import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/providers/all_users.dart';
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
    String email = currentUser == null || currentUser.email == null
        ? '---'
        : currentUser.email!;
    // String name = currentUser == null || currentUser.displayName == null
    //     ? '---'
    //     : currentUser.displayName!;

    final users = ref.watch(allUsersNotifierProvider);

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
            TextButton(
              onPressed: () {
                context.push('/rooms');
              },
              child: const Text('chat room'),
            ),
            Expanded(
              child: users.when(
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
                        final user = data[index];
                        return Text(
                            user.email == null ? 'no email' : user.email!);
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
    );
  }
}

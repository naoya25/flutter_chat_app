import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:my_chat_app/repositories/auth_service.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    String email = user == null || user.email == null ? '----' : user.email!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.push('/counter');
              },
              child: const Text('go to counter page'),
            ),
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
            Text('ログイン中: $email'),
          ],
        ),
      ),
    );
  }
}

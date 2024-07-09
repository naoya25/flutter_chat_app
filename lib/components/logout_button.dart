import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/repositories/auth_service.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final service = AuthService();
        await service.signOut().catchError(
          (e) {
            showSnackbar(context, 'ログアウトに失敗しました: $e');
          },
        );
        if (!context.mounted) return;
        context.go('/login');
        showSnackbar(context, 'ログアウトしました');
      },
      icon: const Icon(Icons.logout),
    );
  }
}

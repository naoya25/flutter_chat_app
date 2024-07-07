import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/repositories/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.push('/counter');
            },
            child: const Text('go to counter page'),
          ),
          TextButton(
            onPressed: () {
              final service = AuthService();
              service.signOut().catchError(
                (e) {
                  throw Exception('ログアウトに失敗しました: $e');
                },
              );
            },
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}

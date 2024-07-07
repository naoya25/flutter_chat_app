import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/repositories/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: TextButton(
        onPressed: () async {
          FirebaseAnalytics.instance.logEvent(name: 'loginボタンが押されました');
          final service = AuthService();
          service.signInWithGoogle().catchError(
            (e) {
              throw Exception('ログインに失敗しました: $e');
            },
          );
        },
        child: const Text('login with google'),
      ),
    );
  }
}

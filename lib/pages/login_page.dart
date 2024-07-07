import 'package:flutter/material.dart';
import 'package:my_chat_app/repositories/auth_service.dart';
import 'package:my_chat_app/utils/firebase_analytics.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Googleアカウントを持っていない者は\n去るが良い...',
              textAlign: TextAlign.center,
            ),
            SignInButton(
              Buttons.google,
              onPressed: () {
                logEvent('loginボタンが押されました');
                final service = AuthService();
                service.signInWithGoogle().catchError(
                  (e) {
                    showSnackbar(context, 'ログインに失敗しました: $e');
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

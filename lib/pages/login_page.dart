import 'package:flutter/material.dart';
import 'package:my_chat_app/repositories/auth_service.dart';
import 'package:my_chat_app/repositories/user.dart';
import 'package:my_chat_app/utils/firebase_analytics.dart';
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
              onPressed: () async {
                logEvent('loginボタンが押されました');
                final service = AuthService();
                final userRepository = UserRepository();
                // google sign in
                final user = await service.signInWithGoogle();
                // register user to firestore
                await userRepository.registerUser(user);
              },
            )
          ],
        ),
      ),
    );
  }
}

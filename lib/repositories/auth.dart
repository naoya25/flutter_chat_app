import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signIn() async {
    debugPrint('sign in');

    const clientId =
        '476057614092-l89jkubtqtio201meikscthmgitilp3c.apps.googleusercontent.com';

    const scopes = [
      'openid',
      'profile',
      'email',
    ];

    final request = GoogleSignIn(clientId: clientId, scopes: scopes);
    final response = await request.signIn();

    final authn = await response?.authentication;
    final accessToken = authn?.accessToken;

    if (accessToken == null) return;

    // firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

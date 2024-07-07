import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'user.g.dart';

// Firebaseからユーザーの変化を取得
@riverpod
Stream<User?> userChanges(UserChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

// ユーザーstate
@riverpod
User? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
    loading: () => null,
    error: (_, __) => null,
    data: (d) => d,
  );
}

// サインイン中かどうか
@riverpod
bool signedIn(SignedInRef ref) {
  final user = ref.watch(userProvider);
  return user != null;
}


// ユーザーID
@riverpod
String userId(UserIdRef ref) {
  throw 'スコープ内の画面でしか使えません';
}

/// ---------------------------------------------------------
/// ユーザーIDを使えるスコープ    >> router/user_id_scope.dart
/// ---------------------------------------------------------
class UserIdScope extends ConsumerWidget {
  const UserIdScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    if (user == null) {
      return const CircularProgressIndicator();
    } else {
      return ProviderScope(
        overrides: [
          userIdProvider.overrideWithValue(user.uid),
        ],
        child: child,
      );
    }
  }
}

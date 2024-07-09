import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/models/db_user.dart';
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
DBUser? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
    data: (d) {
      if (d == null || d.displayName == null || d.email == null) {
        return null;
      } else {
        return DBUser(id: d.uid, name: d.displayName!, email: d.email!);
      }
    },
    loading: () => null,
    error: (_, __) => null,
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
          userIdProvider.overrideWithValue(user.id),
        ],
        child: child,
      );
    }
  }
}

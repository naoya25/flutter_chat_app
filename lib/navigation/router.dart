import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/pages/counter_page.dart';
import 'package:my_chat_app/pages/home_page.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:my_chat_app/providers/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';


@riverpod
GoRouter router(RouterRef ref) {
  final routes = [
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    ),

    // ユーザーIDスコープで囲む
    ShellRoute(
      builder: (_, __, child) => UserIdScope(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: '/counter',
          builder: (_, __) => const CounterPage(),
        ),
      ],
    ),
  ];

  // リダイレクト
  String? redirect(BuildContext context, GoRouterState state) {
    final page = state.uri.toString();
    final signedIn = ref.read(signedInProvider);

    if (signedIn && page == '/login') {
      return '/home';
    } else if (!signedIn) {
      return '/login';
    } else {
      return null;
    }
  }

  // リフレッシュリスナブル
  final listenable = ValueNotifier<Object?>(null);
  ref.listen<Object?>(signedInProvider, (_, newState) {
    listenable.value = newState;
  });
  ref.onDispose(listenable.dispose);

  // GoRouterを作成
  return GoRouter(
    initialLocation: '/login',
    routes: routes,
    redirect: redirect,
    refreshListenable: listenable,
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_chat_app/pages/counter_page.dart';
import 'package:my_chat_app/pages/home_page.dart';
import 'package:my_chat_app/pages/login_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/counter',
      name: 'counter',
      builder: (BuildContext context, GoRouterState state) {
        return const CounterPage();
      },
    ),
  ],
);

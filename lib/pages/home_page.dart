import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: TextButton(
        onPressed: () {
          context.push('/counter');
        },
        child: const Text('go to counter page'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/providers/count.dart';

/// 実験用
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1 = ref.watch(s1NotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('カウンター'),
        ),
        body: Center(
          child: Text(
            '$s1',
            style: const TextStyle(fontSize: 50),
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                final s1Notifier = ref.read(s1NotifierProvider.notifier);
                s1Notifier.inc(context);
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                final s1Notifier = ref.read(s1NotifierProvider.notifier);
                s1Notifier.dec(context);
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}

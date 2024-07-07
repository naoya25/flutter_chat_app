import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'count.g.dart';

/// 実験用
@riverpod
class S1Notifier extends _$S1Notifier {
  @override
  int build() {
    return 0;
  }

  void inc(BuildContext context) {
    if (state < 100) {
      state++;
    } else {
      _showSnackbar(context, 'Value cannot be greater than 100');
    }
  }

  void dec(BuildContext context) {
    if (state > 0) {
      state--;
    } else {
      _showSnackbar(context, 'Value cannot be less than 0');
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

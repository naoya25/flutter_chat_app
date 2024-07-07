import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'count.g.dart';

/// 実験用
@riverpod
class CountNotifier extends _$CountNotifier {
  @override
  int build() {
    return 0;
  }

  void inc(BuildContext context) {
    if (state < 100) {
      state++;
    } else {
      showSnackbar(context, 'Value cannot be greater than 100');
    }
  }

  void dec(BuildContext context) {
    if (state > 0) {
      state--;
    } else {
      showSnackbar(context, 'Value cannot be less than 0');
    }
  }
}

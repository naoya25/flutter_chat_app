import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:ulid/ulid.dart';

part 'chats.g.dart';

@riverpod
class ChatsNotifier extends _$ChatsNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Stream<List<types.Message>> build(String roomId) {
    final chatsStream = db
        .collection('chat_room')
        .doc(roomId)
        .collection('contents')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return types.TextMessage(
          author: types.User(
            id: doc.data()['user_id'],
            firstName: doc.data()['user_name'],
          ),
          createdAt: doc.data()['created_at'],
          id: doc.data()['id'],
          text: doc.data()['text'],
        );
      }).toList();
    });
    return chatsStream;
  }

  void postMessage(
    types.PartialText message,
    String roomId,
    types.User user,
  ) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Ulid().toString(),
      text: message.text,
    );

    db
        .collection('chat_room')
        .doc(roomId)
        .collection('contents')
        .doc(textMessage.id)
        .set({
      'user_id': textMessage.author.id,
      'user_name': textMessage.author.firstName,
      'created_at': textMessage.createdAt,
      'id': textMessage.id,
      'text': textMessage.text,
    });
  }
}

/// 一定時間[ConstantValue.deleteMinutes]経過したチャットを削除する
class ChatsDelete {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> deleteOldMessages() async {
    final now = DateTime.now();
    final deleteMilliseconds = now
        .subtract(const Duration(minutes: ConstantValue.deleteMinutes))
        .millisecondsSinceEpoch;

    final roomsSnapshot = await db.collection('chat_room').get();
    for (final roomDoc in roomsSnapshot.docs) {
      final roomId = roomDoc.id;

      final querySnapshot = await db
          .collection('chat_room')
          .doc(roomId)
          .collection('contents')
          .where('created_at', isLessThan: deleteMilliseconds)
          .get();

      for (final doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    }
    debugPrint('chat delete at ${DateTime.now()}');
  }

  void startAutoDeleteOldMessages() {
    deleteOldMessages();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      deleteOldMessages();
    });
  }
}

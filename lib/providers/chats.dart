import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:ulid/ulid.dart';

part 'chats.g.dart';

@riverpod
class ChatsNotifier extends _$ChatsNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Stream<List<types.Message>> build(String roomName) {
    final chatsStream = db
        .collection('chat_room')
        .doc(roomName)
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
    String roomName,
    types.User user,
  ) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Ulid().toString(),
      text: message.text,
    );

    db.collection('chat_room').doc(roomName).collection('contents').add({
      'user_id': textMessage.author.id,
      'user_name': textMessage.author.firstName,
      'created_at': textMessage.createdAt,
      'id': textMessage.id,
      'text': textMessage.text,
    });
  }
}

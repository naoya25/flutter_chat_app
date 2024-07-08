import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulid/ulid.dart';
part 'chat_rooms.g.dart';

@riverpod
class ChatRoomsNotifier extends _$ChatRoomsNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Stream<List<String>> build() {
    final chatRoomsStream = db
        .collection('chat_room')
        .orderBy('created_at')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.get('name') as String;
      }).toList();
    });
    return chatRoomsStream;
  }

  Future<void> postChatRoom(String roomName) async {
    await db.collection('chat_room').doc(Ulid().toString()).set({
      'name': roomName,
      'created_at': DateTime.now().toLocal().toIso8601String(),
    });
  }
}

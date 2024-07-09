import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/models/room_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulid/ulid.dart';
part 'chat_rooms.g.dart';

@riverpod
class ChatRoomsNotifier extends _$ChatRoomsNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Stream<List<RoomModel>> build() {
    final chatRoomsStream = db
        .collection('chat_room')
        .orderBy('created_at')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RoomModel(
          id: doc.get('id'),
          name: doc.get('name'),
        );
      }).toList();
    });
    return chatRoomsStream;
  }

  Future<void> postChatRoom(String roomName) async {
    String ulid = Ulid().toString();
    await db.collection('chat_room').doc(ulid).set({
      'id': ulid,
      'name': roomName,
      'created_at': DateTime.now().toLocal().toIso8601String(),
    });
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/models/db_user.dart';
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
        .asyncMap((snapshot) async {
      final roomFutures = snapshot.docs.map((doc) async {
        DocumentReference docRef = doc.reference;
        QuerySnapshot membersSnapshot =
            await docRef.collection('members').get();
        List<RoomMemberModel> members = membersSnapshot.docs.map((memberDoc) {
          return RoomMemberModel(
            userId: memberDoc.get('user_id'),
            title: memberDoc.get('title'),
          );
        }).toList();

        return RoomModel(
          id: doc.get('id'),
          members: members,
        );
      }).toList();

      return Future.wait(roomFutures);
    });
    return chatRoomsStream;
  }

  void postChatRoom(DBUser creatorUser, DBUser receiverUser) {
    String ulid = Ulid().toString();
    db.collection('chat_room').doc(ulid).set({
      'id': ulid,
      'created_at': DateTime.now().toLocal().toIso8601String(),
    });

    db.collection('chat_room').doc(ulid).collection('members').add({
      'user_id': creatorUser.id,
      'title': receiverUser.name,
    });
    db.collection('chat_room').doc(ulid).collection('members').add({
      'user_id': receiverUser.id,
      'title': creatorUser.name,
    });
  }
}

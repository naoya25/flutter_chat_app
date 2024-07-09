import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/models/db_user.dart';
import 'package:my_chat_app/models/room_model.dart';
import 'package:my_chat_app/utils/show_snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulid/ulid.dart';
part 'chat_rooms.g.dart';

@riverpod
class ChatRoomsNotifier extends _$ChatRoomsNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Stream<List<RoomModel>> build(String userId) {
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
            isBlock: memberDoc.get('is_block'),
            isPermit: memberDoc.get('is_permit'),
          );
        }).toList();

        // ユーザがこの部屋のメンバーであるかを確認
        bool isMember = members.any((member) => member.userId == userId);

        if (isMember) {
          return RoomModel(
            id: doc.get('id'),
            members: members,
          );
        } else {
          return null;
        }
      }).toList();

      // null ではない部屋だけをリストに含める
      final filteredRooms = await Future.wait(roomFutures);
      return filteredRooms.whereType<RoomModel>().toList();
    });
    return chatRoomsStream;
  }

  Future<void> postChatRoom(
    DBUser creatorUser,
    DBUser receiverUser,
    BuildContext context,
  ) async {
    // 既存のチャットルームをチェック
    QuerySnapshot existingRooms = await db.collection('chat_room').get();

    bool chatRoomExists = false;

    for (var room in existingRooms.docs) {
      QuerySnapshot members = await db
          .collection('chat_room')
          .doc(room.id)
          .collection('members')
          .get();
      List<String> memberIds =
          members.docs.map((doc) => doc.get('user_id') as String).toList();
      if (memberIds.contains(creatorUser.id) &&
          memberIds.contains(receiverUser.id)) {
        chatRoomExists = true;
        break;
      }
    }

    if (chatRoomExists) {
      if (!context.mounted) return;
      showSnackbar(context, 'すでにチャットが存在します');
      return;
    }

    String ulid = Ulid().toString();
    db.collection('chat_room').doc(ulid).set({
      'id': ulid,
      'created_at': DateTime.now().toLocal().toIso8601String(),
    });

    db
        .collection('chat_room')
        .doc(ulid)
        .collection('members')
        .doc(creatorUser.id)
        .set({
      'user_id': creatorUser.id,
      'title': receiverUser.name,
      'is_block': false,
      'is_permit': true,
    });
    db
        .collection('chat_room')
        .doc(ulid)
        .collection('members')
        .doc(receiverUser.id)
        .set({
      'user_id': receiverUser.id,
      'title': creatorUser.name,
      'is_block': false,
      'is_permit': false,
    });
    if (!context.mounted) return;
    showSnackbar(context, '正常に作成されました');
  }
}

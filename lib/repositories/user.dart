import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_chat_app/models/db_user.dart';

class UserRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // firebase authenticationのUserからfirestoreのusersに追加
  Future<DBUser?> registerUser(User? user) async {
    try {
      if (user != null) {
        await db.collection('users').doc(user.uid).set(
          {
            'id': user.uid,
            'email': user.email,
            'name': user.displayName,
          },
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // usersを全て取得
  Future<List<DBUser>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await db.collection('users').get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      List<DBUser> users = docs.map(
        (doc) {
          return DBUser.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      return users;
    } catch (e) {
      return [];
    }
  }
}

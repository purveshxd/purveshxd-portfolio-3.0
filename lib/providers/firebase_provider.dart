import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final db = FirebaseFirestore.instance.collection('profile');

  // login the admin to change the database
  Future<bool> login(
      {required String username, required String password}) async {
    try {
      var data = await db.doc('purveshdongarwar_firebase').get();
      final username_db = data.get('username') as String;
      final pass_db = data.get('pass') as String;

      if (username_db == username && pass_db == password) {
        return Future.delayed(Duration.zero, () => true);
      } else {
        return Future.delayed(Duration.zero, () => false);
      }
    } catch (e) {
      log("Auth error $e");
      throw Exception(e);
    }
  }
}

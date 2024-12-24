import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purveshxdev/models/user_model.dart';

class FirebaseProvider {
  final db = FirebaseFirestore.instance.collection('profile');

  late UserModel _userModel;

  // get all firebase data
  Future<void> getData() async {
    try {
      var data = await db.doc('purveshdongarwar_firebase').get();
      var temp = data.data();
      log(temp.toString());
      final userModelData = UserModel.fromMap(temp!);
      _userModel = userModelData;
    } catch (e) {
      log("error getting firebase data ${e.toString()}", error: e);
      throw Exception(e);
    }
  }

  // login the admin to change the database
  bool login({required String username, required String password}) {
    try {
      var data = _userModel;

      final usernameDb = data.profile.username;
      final passDb = data.profile.pass;

      if (usernameDb == username && passDb == password) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Auth error $e");
      throw Exception(e);
    }
  }

  List<Project> getProjects() {
    var projectData = _userModel.projects;

    return projectData;
  }

  uploadProject() async {
    try {} catch (e) {}
  }
}

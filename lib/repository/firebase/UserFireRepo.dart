import 'dart:io';

import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:fbn_academy_mobile/models/User.dart';
import 'package:fbn_academy_mobile/repository/abs/UserRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../common/Constants.dart';

class UserFireRepo implements UserRepo {
  final DatabaseReference _db_users =
      FirebaseDatabase.instance.ref(DbPaths.users);
  UtilServices utilServices = UtilServices();

  @override
  Future<void> createUser(AUser aUser) async {
    aUser.deviceInfo = await utilServices.getdeviceinfo();
    aUser.userToken = utilServices.uniqueUserToken(aUser);
    await _db_users.child(aUser.id).set(aUser.toJson());
  }

  @override
  Future<void> deleteUser(int id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await _db_users.child(user!.uid).remove();
    }
  }

  @override
  Future<AUser?> getUserById(int id) async {
    User? newUser = FirebaseAuth.instance.currentUser;
    if (newUser != null) {
      DataSnapshot snapshot = await _db_users.child(newUser!.uid).get();
      if (snapshot.value != null) {
        Map<dynamic, dynamic> newPost = snapshot.value as Map<dynamic, dynamic>;
        AUser? a = AUser.fromJson(newPost);
        print('User data: ${a!.toJsonString()}');
        return a;
      } else {
        return null; // User not found
      }
    }
  }

  @override
  Future<void> updateUser(AUser aUser) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _db_users.child(user!.uid).update(aUser.toJson());
    }
  }

  @override
  Future<String> uploadUserImage(File imageFile) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final FirebaseStorage storage = FirebaseStorage.instance;

    User? user = auth.currentUser;

    if (user != null) {

      try {

        Reference ref = storage.ref().child('profile_images/${user.uid}');
        UploadTask uploadTask = ref.putFile(imageFile);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

        String downloadURL = await snapshot.ref.getDownloadURL();

        await _db_users.child(user.uid).update({
          'profilePictureUrl': downloadURL,

        }).then((value) {

          UtilsWidgets.successSnack("Uploaded Successfully");
        });


        return downloadURL;


    }
    catch (e) {
        UtilsWidgets.errorSnack( "Failed to upload profile picture.");
        return "";
      }
    }
    else {
      UtilsWidgets.errorSnack( "User not logged in.");
    return "";
    }
  }
}

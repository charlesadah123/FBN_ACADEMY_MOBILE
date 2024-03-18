import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/models/User.dart';
import 'package:fbn_academy_mobile/repository/abs/UserRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../common/Constants.dart';


class UserFireRepo implements UserRepo{

  User? user=FirebaseAuth.instance.currentUser;
  final DatabaseReference _db_users= FirebaseDatabase.instance.ref(DbPaths.users);
  UtilServices  utilServices= UtilServices();


  @override
  Future<void> createUser(AUser aUser) async{
    if( user!= null) {
      aUser.deviceInfo= await utilServices.getdeviceinfo();
      aUser.userToken=utilServices.uniqueUserToken(aUser);
       await _db_users.child(user!.uid).set(aUser.toJson());
    }
  }

  @override
  Future<void> deleteUser(int id) async{
    if(user !=null){
      return await _db_users.child(user!.uid).remove();
    }
  }

  @override
  Future<AUser?> getUserById(int id) async{
    if(user !=null){
     DataSnapshot snapshot=  await _db_users.child(user!.uid).get();
        if (snapshot.value != null) {
          Map<dynamic, dynamic> newPost = snapshot.value as Map<dynamic, dynamic>;
          AUser? a= AUser.fromJson(newPost);
          print('User data: ${a!.toJsonString()}');

          return a;
        } else {
          return null; // User not found
        }

      }
    }



  @override
  Future<void> updateUser(AUser aUser) async{
    if( user!= null) {
     await _db_users.child(user!.uid).update(aUser.toJson());
    }
  }


  }
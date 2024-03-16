import 'package:fbn_academy_mobile/models/User.dart';
import 'package:fbn_academy_mobile/repository/abs/UserRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../common/Constants.dart';


class UserFireRepo implements UserRepo{

  User? user=FirebaseAuth.instance.currentUser;
  DatabaseReference db_users= FirebaseDatabase.instance.ref(DbPaths.users);

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceid;

  Future<Map<dynamic,dynamic>?> _setdeviceinfo() async {
    Map<dynamic, dynamic?> mapDeviceInfo;

    if (GetPlatform.isAndroid == true) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceid = androidInfo.id + androidInfo.androidId;
      return mapDeviceInfo = {
        Dbkeys.deviceInfoMODEL: androidInfo.model,
        Dbkeys.deviceInfoOS: 'android',
        Dbkeys.deviceInfoISPHYSICAL: androidInfo.isPhysicalDevice,
        Dbkeys.deviceInfoDEVICEID: androidInfo.id,
        Dbkeys.deviceInfoOSID: androidInfo.androidId,
        Dbkeys.deviceInfoOSVERSION: androidInfo.version.baseOS,
        Dbkeys.deviceInfoMANUFACTURER: androidInfo.manufacturer,
        Dbkeys.deviceInfoLOGINTIMESTAMP: DateTime.now().toIso8601String(),
      };
    }
    else if (GetPlatform.isIOS == true) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      deviceid = iosInfo.systemName + iosInfo.model + iosInfo.systemVersion;
     return mapDeviceInfo = {
        Dbkeys.deviceInfoMODEL: iosInfo.model,
        Dbkeys.deviceInfoOS: 'ios',
        Dbkeys.deviceInfoISPHYSICAL: iosInfo.isPhysicalDevice,
        Dbkeys.deviceInfoDEVICEID: iosInfo.identifierForVendor,
        Dbkeys.deviceInfoOSID: iosInfo.name,
        Dbkeys.deviceInfoOSVERSION: iosInfo.name,
        Dbkeys.deviceInfoMANUFACTURER: iosInfo.name,
        Dbkeys.deviceInfoLOGINTIMESTAMP: DateTime.now().toIso8601String(),
      };

    }
  }

  @override
  Future<void> createUser(AUser aUser) async{
    if( user!= null) {
      aUser.deviceInfo= await _setdeviceinfo();
       await db_users.child(user!.uid).set(aUser.toJson());
    }
  }

  @override
  Future<void> deleteUser(int id) async{
    if(user !=null){
      return await db_users.child(user!.uid).remove();
    }
  }

  @override
  Future<AUser?> getUserById(int id) async{
    if(user !=null){
     DataSnapshot snapshot=  await db_users.child(user!.uid).get();
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
     await db_users.child(user!.uid).update(aUser.toJson());
    }
  }


  }
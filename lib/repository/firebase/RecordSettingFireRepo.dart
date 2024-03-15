import 'package:fbn_academy_mobile/repository/abs/RecordRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../common/Constants.dart';
import '../../models/Record.dart';
import '../../models/RecordSetting.dart';
import '../abs/RecordSettingRepo.dart';

class RecordSettingFireRepo implements RecordSettingRepo {

  User? user=FirebaseAuth.instance.currentUser;
  DatabaseReference db_RecordSettings= FirebaseDatabase.instance.ref(DbPaths.recordSetting);


  @override
  Future<void> createRecordSetting(RecordSetting RecordSetting) async{
    if( user!= null) {
     return await db_RecordSettings.child(user!.uid).update(RecordSetting.toJson());
    }
  }

  @override
  Future<void> deleteRecordSetting(int id) async{

    if(user !=null){
      return await db_RecordSettings.child(user!.uid).remove();
    }

  }

  @override
  Future<List<RecordSetting>?> getAllRecordSettingById(int id) async{

    if(user !=null){

      DataSnapshot snapshot = await db_RecordSettings.child(user!.uid).get();

      List<RecordSetting> RecordSettingList = [];

      if (snapshot.value != null) {
        // Iterate through the snapshot and convert each user's data to IUser object
        snapshot.children.forEach((child) {
          RecordSetting rec = RecordSetting.fromJson(child as Map<String, dynamic>);
            RecordSettingList.add(rec);
        });
      }
      return RecordSettingList;

    }

  }

  @override
  Future<RecordSetting?> getRecordSettingById(int id) async{
    if(user !=null){
      DataSnapshot snapshot= await db_RecordSettings.get();
      return snapshot as RecordSetting;
    }
    return null;
  }

  @override
  Future<void> updateRecordSetting(RecordSetting RecordSetting) async{
    return await createRecordSetting(RecordSetting);
  }


}
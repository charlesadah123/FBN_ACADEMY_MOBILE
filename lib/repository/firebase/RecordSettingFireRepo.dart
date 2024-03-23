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
  Future<void> createRecordSetting(RecordSetting recordSetting) async{
    if( user!= null) {
       await db_RecordSettings.child(recordSetting.id).set(recordSetting.toJson());
      //.update(record.toJson());
    }
  }

  @override
  Future<void> deleteRecordSetting(int id) async{

  }

  @override
  Future<RecordSetting?> getRecordSetting() async{

    if(user !=null){
      DataSnapshot snapshot = await db_RecordSettings.child("first").get();

      RecordSetting rec = RecordSetting.fromJson(snapshot.value as Map<dynamic, dynamic>);
      print("rec ${rec.toJsonString()}");
      return rec;
    }

  }

  @override
  Future<void> updateRecordSetting(RecordSetting recordSetting) async{

  }


}
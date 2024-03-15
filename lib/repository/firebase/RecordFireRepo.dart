import 'package:fbn_academy_mobile/repository/abs/RecordRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../common/Constants.dart';
import '../../models/Record.dart';

class RecordFireRepo implements RecordRepo {

  User? user=FirebaseAuth.instance.currentUser;
  DatabaseReference db_records= FirebaseDatabase.instance.ref(DbPaths.records);


  @override
  Future<void> createRecord(AttendanceRecord record) async{
    if( user!= null) {
     return await db_records.child(user!.uid).update(record.toJson());
    }
  }

  @override
  Future<void> deleteRecord(int id) async{

    if(user !=null){
      return await db_records.child(user!.uid).remove();
    }

  }

  @override
  Future<List<AttendanceRecord>?> getAllRecordById(int id) async{

    if(user !=null){

      DataSnapshot snapshot = await db_records.child(user!.uid).get();

      List<AttendanceRecord> recordList = [];

      if (snapshot.value != null) {
        // Iterate through the snapshot and convert each user's data to IUser object
        snapshot.children.forEach((child) {
          AttendanceRecord rec = AttendanceRecord.fromJson(child as Map<String, dynamic>);
            recordList.add(rec);
        });
      }
      return recordList;

    }

  }

  @override
  Future<AttendanceRecord?> getRecordById(int id) async{
    if(user !=null){
      return null;
    }
    return null;
  }

  @override
  Future<void> updateRecord(AttendanceRecord record) async{
    return await createRecord(record);
  }


}
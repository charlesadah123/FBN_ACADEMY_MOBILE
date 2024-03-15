
import '../../models/Record.dart';

abstract class RecordSv {

  Future<void> createRecord(AttendanceRecord record);

  Future<void> deleteRecord(int id) ;

  Future<List<AttendanceRecord>?> getAllRecordById(int id);

  Future<AttendanceRecord?> getRecordById(int id);

  Future<void> updateRecord(AttendanceRecord record);

}
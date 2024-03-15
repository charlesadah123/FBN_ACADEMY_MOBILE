import 'package:fbn_academy_mobile/models/Record.dart';
import 'package:fbn_academy_mobile/repository/abs/RecordRepo.dart';
import 'package:fbn_academy_mobile/repository/firebase/RecordFireRepo.dart';
import 'package:fbn_academy_mobile/services/abs/RecordSv.dart';

class RecordService implements RecordSv {
  final RecordRepo _recordRepo;

  RecordService([RecordRepo? recordRepo])
      : _recordRepo = recordRepo ?? RecordFireRepo();

  @override
  Future<void> createRecord(AttendanceRecord record) async {
    await _recordRepo.createRecord(record);
  }

  @override
  Future<void> deleteRecord(int id) async {
    await _recordRepo.deleteRecord(id);
  }

  @override
  Future<List<AttendanceRecord>?> getAllRecordById(int id) async {
    await _recordRepo.getAllRecordById(id);
  }

  @override
  Future<AttendanceRecord?> getRecordById(int id) async {
    await _recordRepo.getRecordById(id);
  }

  @override
  Future<void> updateRecord(AttendanceRecord record) async {
    await _recordRepo.updateRecord(record);
  }
}

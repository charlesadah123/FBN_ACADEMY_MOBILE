import '../../models/Record.dart';

abstract class RecordRepo {
  // Create a new Record
  Future<void> createRecord(AttendanceRecord record);

  // Retrieve a Record by ID
  Future<AttendanceRecord?> getRecordById(int id);

  // Update an existing Record
  Future<void> updateRecord(AttendanceRecord record);

  // Delete a Record by ID
  Future<void> deleteRecord(int id);

// Delete a Record by ID
  Future<List<AttendanceRecord>?> getAllRecordById(int id);
}

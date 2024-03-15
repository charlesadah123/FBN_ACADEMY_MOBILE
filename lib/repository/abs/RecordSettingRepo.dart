import '../../models/Record.dart';
import '../../models/RecordSetting.dart';

abstract class RecordSettingRepo {
  // Create a new Record
  Future<void> createRecordSetting(RecordSetting RecordSetting);

  // Retrieve a RecordSetting by ID
  Future<RecordSetting?> getRecordSettingById(int id);

  // Update an existing RecordSetting
  Future<void> updateRecordSetting(RecordSetting RecordSetting);

  // Delete a RecordSetting by ID
  Future<void> deleteRecordSetting(int id);

// Delete a RecordSetting by ID
  Future<List<RecordSetting>?> getAllRecordSettingById(int id);
}

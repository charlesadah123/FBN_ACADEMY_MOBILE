// ignore_for_file: file_names, non_constant_identifier_names

import '../../models/RecordSetting.dart';

abstract class RecordSettingRepo {
  // Create a new Record
  Future<void> createRecordSetting(RecordSetting RecordSetting);

  // Update an existing RecordSetting
  Future<void> updateRecordSetting(RecordSetting RecordSetting);

  // Delete a RecordSetting by ID
  Future<void> deleteRecordSetting(int id);

// Delete a RecordSetting by ID
  Future<RecordSetting?> getRecordSetting();
}

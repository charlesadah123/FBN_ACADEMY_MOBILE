// ignore_for_file: file_names, non_constant_identifier_names

import '../../models/RecordSetting.dart';

abstract class RecordSettingSv {
  Future<void> createRecordSetting(RecordSetting RecordSetting);

  Future<void> deleteRecordSetting(int id);

  Future<RecordSetting?> getRecordSetting();

  Future<void> updateRecordSetting(RecordSetting record);
}


import '../../models/Record.dart';
import '../../models/RecordSetting.dart';

abstract class RecordSettingSv {

  Future<void> createRecordSetting(RecordSetting RecordSetting);

  Future<void> deleteRecordSetting(int id) ;

  Future<List<RecordSetting>?> getAllRecordSettingById(int id);

  Future<RecordSetting?> getRecordSettingById(int id);

  Future<void> updateRecordSetting(RecordSetting record);

}
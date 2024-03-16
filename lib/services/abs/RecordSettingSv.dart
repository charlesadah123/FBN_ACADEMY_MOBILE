
import '../../models/Record.dart';
import '../../models/RecordSetting.dart';

abstract class RecordSettingSv {

  Future<void> createRecordSetting(RecordSetting RecordSetting);

  Future<void> deleteRecordSetting(int id) ;

  Future<RecordSetting?> getRecordSetting();

  Future<void> updateRecordSetting(RecordSetting record);

}
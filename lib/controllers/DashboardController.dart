import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:fbn_academy_mobile/models/RecordSetting.dart';
import 'package:fbn_academy_mobile/models/User.dart';
import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../common/Constants.dart';
import '../common/UtilServices.dart';
import '../models/Record.dart';
import '../screens/dashboard/TakeAttendanceScreen.dart';
import '../screens/widgets/AttendanceSuccess.dart';
import '../screens/widgets/AuthOther.dart';
import '../services/BiometricService.dart';
import '../services/LocationService.dart';
import '../services/RecordService.dart';
import '../services/RecordSettingService.dart';
import '../services/UserService.dart';
import 'UserController.dart';

class DashboardController extends GetxController {
  final UtilServices utilServices = UtilServices();

  RecordService recordService = RecordService();
  AuthService authService = AuthService();
  BiometricService biometricService = BiometricService();
  LocationService locationService = LocationService();
  UtilServices uServices = UtilServices();

  UserController userCtrl = Get.find<UserController>();
  RxList<AttendanceRecord> records = <AttendanceRecord>[].obs;
  RxMap<String, dynamic> statistics = <String, dynamic>{}.obs;
  var dashLoading = false.obs;
  var attendanceLoading = false.obs;
  var currentTask = "".obs;
  AUser? aUser;

  @override
  void onInit() async {
    await getRecords();
    calculateStatistics();
    super.onInit();
  }

  Future getRecords() async {

      try {
        dashLoading.value = true;
        List<AttendanceRecord>? result = await recordService.getAllRecordById(0);
        if (result != null) {
          records.value.assignAll(result);
        }
        print("done getting records");
      } catch (e) {
        print("Error retrieving records");
      } finally {
        dashLoading.value = false;
        print("finally  ${dashLoading.value}");
      }

  }

  calculateStatistics({Duration? duration}) {
    try {
      if (duration == null) {
        final startDate = DateTime.now().subtract(const Duration(days: 30));
        duration = DateTime.now().difference(startDate);
      }

      DateTime today = DateTime.now();
      DateTime startDate = today.subtract(duration!);
      int totalDaysPresent = 0;
      int totalDaysAbsent = 0;
      int totalSickLeaveDays = 0;
      int totalLatenessDays = 0;
      int totalOtherLeaveDays = 0;
      DateTime lastCheckInTime = DateTime(2000); // Initialize with a past date

      for (AttendanceRecord record in records) {
        if (record.checkInTime.isAfter(startDate)) {
          if (record.isPresent) {
            totalDaysPresent++;
          } else {
            totalDaysAbsent++;
          }
          if (record.isSickLeave) {
            totalSickLeaveDays++;
          }
          if (record.isLate) {
            totalLatenessDays++;
          }
          if (record.isOtherLeave) {
            totalOtherLeaveDays++;
          }
          if (record.checkInTime.isAfter(lastCheckInTime)) {
            lastCheckInTime = record.checkInTime;
          }
        }
      }

      print("calculation  done");
      statistics.value = {
        'totalDaysPresent': totalDaysPresent,
        'lastCheckInTime': lastCheckInTime,
        'totalDaysAbsent': totalDaysAbsent,
        'totalSickLeaveDays': totalSickLeaveDays,
        'totalLatenessDays': totalLatenessDays,
        'totalOtherLeaveDays': totalOtherLeaveDays,
      };
      statistics.refresh();
      print("done getting calculation");
    } catch (e) {}
  }

  List<AttendanceRecord> filterRecords(Duration duration) {
    DateTime today = DateTime.now();
    DateTime startDate = today.subtract(duration);
    return records
        .where((record) => record.checkInTime.isAfter(startDate))
        .toList();
  }

  checkDeviceToken() async {
    bool isConnected= await UtilServices.checkInternetConnectivity();

    if(isConnected){
      aUser = await userCtrl.getUser(0);

      if (aUser != null) {
        String? token = await utilServices.uniqueDeviceToken();

        bool isUsed = await utilServices.isDeviceTokenUsed(token!);

        print("isUsed $isUsed");

        if (!isUsed) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: Get.context!,
              builder: (BuildContext context) {
                return TakeAttendanceScreen();
              });
        } else {
          UtilsWidgets.errorSnack( "Attendance Taken Already");
        }
      }
    } else{
      UtilsWidgets.errorSnack( "No Internet Connection");
    }

  }

  takeAttendance(AuthType type) async {

    bool isConnected= await UtilServices.checkInternetConnectivity();

    if(isConnected){

      ProgressDialog pd=UtilsWidgets.showProgress("Setting Up...", Get.context!);



      try {
        TextEditingController passwordController = TextEditingController();
        TextEditingController otpController = TextEditingController();

        pd.close();
         pd=UtilsWidgets.showProgress("Getting Location", Get.context!);

        double distance = await LocationService().calculateProximity(MyConstants.firstAcademyLat, MyConstants.firstAcademyLong);

        pd.close();

        pd=UtilsWidgets.showProgress("Done with Location", Get.context!);

        if (distance <= 30) {

          if (type == AuthType.biometric) {

            pd.close();

            pd=UtilsWidgets.showProgress("Setting up biometric", Get.context!);

            pd.close();

            await biometricService.biometricAuth().then((value) {

              pd=UtilsWidgets.showProgress("Creating Attendance Record", Get.context!);

              _createAttendanceRecord(value);

              pd.close();

            });

          } else {
            pd=UtilsWidgets.showProgress("Verifying phone", Get.context!);

            await authService.verifyPhone(aUser!.phone);

            pd.close();


            String? password;
            String? otpCode;

            await showModalBottomSheet(
                isScrollControlled: true,
                context: Get.context!,
                isDismissible: false,
                builder: (BuildContext context) {
                  return AuthOther(
                      otpController: otpController,
                      passwordController: passwordController);
                }).then((value) async {
              password = passwordController.text.trim();
              otpCode = otpController.text.trim();

              if (password!.isNotEmpty || otpCode!.isNotEmpty) {
                pd=UtilsWidgets.showProgress("Verifying credentials", Get.context!);
                await authService
                    .authOther(otpCode!, aUser!.email, password!)
                    .then((value) {
                  _createAttendanceRecord(value);
                });

                pd.close();

              }
            });
          }
        }
        else {
          UtilsWidgets.errorSnack( "${distance-40} From Academy");
        }
      } catch (e) {
        // show error dialog
        print("Error $e.");
      } finally {
        if(pd.isOpen()){
          pd.close();
        }
      }

    }
    else{
      UtilsWidgets.errorSnack( "No Internet Connection");
    }

  }

  _createAttendanceRecord(bool isAuth) async {
    if (isAuth) {
      RecordSetting? recordSetting =
          await RecordSettingService().getRecordSetting();

      String? token = await utilServices.uniqueDeviceToken();

      recordService
          .createRecord(AttendanceRecord(
              userId: aUser!.id,
              checkInTime: DateTime.now(),
              isPresent: DateTime.now().isAfter(recordSetting!.stopLateTime),
              isLate: DateTime.now().isAfter(recordSetting!.startTime),
              isSickLeave: false,
              isOtherLeave: false,
              deviceToken: token!,
              userToken: aUser!.userToken!,
              updatedAt: DateTime.now(),
              createdAt: DateTime.now()))
          .then((value) {
        showModalBottomSheet(
          isDismissible: false,
            isScrollControlled: true,
            context: Get.context!,
            builder: (BuildContext context) {
              return const AttendanceSuccess();
            });
      });
    } else {
      UtilsWidgets.errorSnack( "Error Authenticating");
    }
  }
}

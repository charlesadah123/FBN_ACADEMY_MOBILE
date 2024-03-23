// ignore_for_file: file_names, avoid_print

import 'dart:io';

import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:fbn_academy_mobile/services/UserService.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../models/User.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  var loading = false.obs;
  var imageUrl = "".obs;
  AUser? aUser;

  @override
  void onInit() async {
    aUser = await getUser(0);
    imageUrl.value = aUser!.profilePictureUrl!;
    super.onInit();
  }

  Future createUser(AUser iuser) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();

    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Creating User", Get.context!);

      await _userService.createUser(iuser);
      pd.close();
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }

  Future updateUser(AUser iuser) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();

    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Updating User", Get.context!);
      await _userService.updateUser(iuser);
      pd.close();
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }

  Future<String> uploadUserImage(File imageFile) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();

    if (isConnected) {
      ProgressDialog pd = UtilsWidgets.showProgress("Uploading", Get.context!);
      String result = await _userService.uploadUserImage(imageFile);
      pd.close();

      return result;
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
      return "";
    }
  }

  Future<AUser?> getUser(int id) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      print("Getting user");
      loading.value = true;
      AUser? aUser = await _userService.getUserById(id);
      loading.value = false;
      return aUser;
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
    return null;
  }

  Future deleteUser(int id) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      loading.value = true;
      await _userService.deleteUser(id);
      loading.value = false;
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }
}

// ignore_for_file: file_names, avoid_print

import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/controllers/UserController.dart';
import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../common/UtilsWidgets.dart';
import '../models/User.dart';
import '../screens/authentication/LoginScreen.dart';
import '../screens/dashboard/DashboardScreen.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final UtilServices utilServices = UtilServices();

  UserController userCtrl = Get.find<UserController>();

  var loading = false.obs;

  Future register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Authenticating User", Get.context!);

      try {
        UserCredential? credential =
            await _authService.emailPasswordCreateUser(email, password);

        final user = credential!.user;

        if (user != null) {
          AUser aUser = AUser(
              id: user.uid,
              fullName: name,
              email: email,
              phone: phone,
              password: password,
              profilePictureUrl: "");

          aUser.password = utilServices.encryptPassword(aUser.password)!;

          await userCtrl.createUser(aUser);

          AUser? createdAuser = await userCtrl.getUser(0);

          userCtrl.aUser = createdAuser;

          pd.close();

          Get.offAll(() => const DashboardScreen());
        } else {
          pd.close();
          print("Error Authenticating user");
        }
      } catch (e) {
        UtilsWidgets.errorSnack(UtilServices.handleAuthError(e));
      } finally {
        pd.close();
      }
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }

  Future signIn(String email, String password) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Authenticating User", Get.context!);

      try {
        UserCredential? credential =
            await _authService.emailPasswordSignIn(email, password);

        if (credential!.user != null) {
          AUser? aUser = await userCtrl.getUser(0);

          aUser!.deviceInfo = await utilServices.getdeviceinfo();

          await userCtrl.updateUser(aUser);

          userCtrl.aUser = aUser;
          userCtrl.imageUrl.value = aUser.profilePictureUrl!;

          pd.close();
          Get.offAll(() => const DashboardScreen());
        } else {
          print("Error authenticating");
        }
      } catch (e) {
        UtilsWidgets.errorSnack(UtilServices.handleAuthError(e));
      } finally {
        if (pd.isOpen()) {
          pd.close();
        }
      }
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }

  Future logOut() async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Signing Out", Get.context!);

      await _authService.logOut();
      pd.close();
      Get.offAll(() => LoginScreen());
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }

  Future otpAuth(String phone) async {
    bool isConnected = await UtilServices.checkInternetConnectivity();
    if (isConnected) {
      ProgressDialog pd =
          UtilsWidgets.showProgress("Verifying...", Get.context!);
      await _authService.verifyPhone(phone);
      pd.close();
      await UtilsWidgets.verifyCodeBottomSheet(_authService);
      loading.value = false;
    } else {
      UtilsWidgets.errorSnack("No Internet Connection");
    }
  }
}

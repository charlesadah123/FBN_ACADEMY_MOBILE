import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/controllers/UserController.dart';
import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../common/UtilsWidgets.dart';
import '../models/User.dart';
import '../screens/authentication/LoginScreen.dart';
import '../screens/dashboard/DashboardScreen.dart';

class AuthController extends GetxController {

  final AuthService _authService = AuthService();

  final UtilServices utilServices = UtilServices();

  UserController userCtrl = Get.find<UserController>();

  var loading = false.obs;

  Future register(AUser aUser) async {
    loading.value = true;
    UserCredential? credential = await _authService.emailPasswordSignIn(aUser.email, aUser.password);
    if (credential!.user != null) {
      aUser.password= utilServices.encryptPassword(aUser.password)!;
     await userCtrl.createUser(aUser);
     Get.off(const DashboardScreen());
    } else {
      print("Error Authenticating user");
    }

    loading.value = false;
  }

  Future signIn(String email, String password) async {
    loading.value = true;

    UserCredential? credential =
        await _authService.emailPasswordSignIn(email, password);

    if (credential!.user != null) {

      AUser? aUser = await userCtrl.getUser(0);

      aUser!.deviceInfo = await utilServices.getdeviceinfo();

      await userCtrl.updateUser(aUser);

      loading.value = false;

       Get.off(const DashboardScreen());

    } else {

      loading.value = false;

      print("Error authenticating");

    }
  }

  Future logOut() async {
    loading.value = true;
    await _authService.logOut();
    loading.value = false;
    Get.off(const LoginScreen());
  }

  Future otpAuth(String phone) async {
    loading.value = true;
    await _authService.verifyPhone( phone!);
    await UtilsWidgets.verifyCodeBottomSheet(_authService);
    loading.value = false;
  }

}

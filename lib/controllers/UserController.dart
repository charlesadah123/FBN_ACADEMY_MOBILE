import 'package:fbn_academy_mobile/services/UserService.dart';
import 'package:get/get.dart';
import '../models/User.dart';


class UserController extends GetxController {
  final UserService _userService = UserService();
  var loading = false.obs;

  Future createUser(AUser iuser) async {
    loading.value = true;
    await _userService.createUser(iuser);
    loading.value = false;
  }

  Future updateUser(AUser iuser) async {
    loading.value = true;
    await _userService.updateUser(iuser);
    loading.value = false;
  }

  Future<AUser?> getUser(int id) async {
    loading.value = true;
    AUser? user = await _userService.getUserById(id);
    loading.value = false;
    return user;
  }



  Future deleteUser(int id) async {
    loading.value = true;
    await _userService.deleteUser(id);
    loading.value = false;
  }
}

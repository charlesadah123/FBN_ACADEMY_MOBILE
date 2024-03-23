// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthSv {
  Future<UserCredential?> otpAuth(String smsCode);

  Future verifyPhone(String phone);

  Future<UserCredential?> emailPasswordSignIn(String email, String password);

  Future<UserCredential?> emailPasswordCreateUser(
      String email, String password);

  Future<bool> authOther(String sms, String email, String password);

  Future logOut();
}

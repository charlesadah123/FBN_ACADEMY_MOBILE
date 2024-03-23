// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<UserCredential?> emailPasswordSignIn(String email, String password);

  Future<UserCredential?> emailPasswordCreateUser(
      String email, String password);

  Future<UserCredential?> otpAuth(String smsCode);

  Future<void> verifyPhone({required String phone});

  Future<void> logOut();
}

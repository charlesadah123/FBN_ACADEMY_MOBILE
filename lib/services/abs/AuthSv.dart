import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthSv{

  Future<UserCredential?> otpAuth(String smsCode);

  Future verifyPhone(String phone);

  Future<UserCredential?> emailPasswordSignIn(String email, String password);

  Future logOut();

}
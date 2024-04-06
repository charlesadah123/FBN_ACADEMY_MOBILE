
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/User.dart';

abstract class AuthRepo {

  Future<UserCredential?> emailPasswordSignIn(String email, String password);

  Future<UserCredential?> emailPasswordCreateUser(String email, String password);

  Future<UserCredential?> otpAuth(String smsCode);

  Future<void> verifyPhone({required String phone});

  Future<void>  logOut();

  Future<void>  forgotPassword(String email);

}

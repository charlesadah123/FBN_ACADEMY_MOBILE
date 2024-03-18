import 'package:fbn_academy_mobile/repository/abs/AuthRepo.dart';
import 'package:fbn_academy_mobile/repository/abs/UserRepo.dart';
import 'package:fbn_academy_mobile/repository/firebase/AuthFireRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'abs/AuthSv.dart';

class AuthService implements AuthSv{

  final AuthRepo _authRepo;
  AuthService([AuthRepo? authRepo])
      : _authRepo = authRepo ?? AuthFireRepo();


  @override
  Future<UserCredential?> emailPasswordSignIn(String email, String password) async{
  return await _authRepo.emailPasswordSignIn(email, password);
  }

  @override
  Future logOut() async{
 await _authRepo.logOut();
  }

  @override
  Future<UserCredential?> otpAuth(String smsCode) async{
    await _authRepo.otpAuth(smsCode);
  }

  @override
  Future<void> verifyPhone(String phone) async{
    await _authRepo.verifyPhone(phone: phone);
  }


}
import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/error_codes.dart';
import 'package:local_auth/local_auth.dart';

import '../abs/AuthRepo.dart';

class AuthFireRepo implements AuthRepo {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String verificationId;
  int? resendToken;

  @override
  Future<UserCredential> otpAuth(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );

    // Sign the user in (or link) with the credential
   return await _handlePhoneSignIn(credential);
  }

  @override
  Future<UserCredential?> emailPasswordSignIn(String email, String password) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> _handlePhoneSignIn(PhoneAuthCredential credential) async {
    return await firebaseAuth.signInWithCredential(credential);
  }

  @override
  verifyPhone({required String phone}) async {
    await firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phone,
      verificationCompleted: mVerCompleted,
      verificationFailed: UtilsWidgets.mVerFailed,
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        this.resendToken = resendToken;
      },
      codeAutoRetrievalTimeout: UtilsWidgets.mCodeAutoRetrievalTimeout,
    );
  }

  Future<UserCredential?> mVerCompleted(PhoneAuthCredential credential) async{
    if (GetPlatform.isAndroid == true) {
     return await _handlePhoneSignIn(credential);
    }
  }

  @override
  Future logOut()async{

    await FirebaseAuth.instance.signOut();

  }

}

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
  Future<void> otpAuth(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );

    // Sign the user in (or link) with the credential
    _handlePhoneSignIn(credential);
  }

  @override
  Future<void> emailPasswordSignIn(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

  _handlePhoneSignIn(PhoneAuthCredential credential) async {
    await firebaseAuth.signInWithCredential(credential);
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

  mVerCompleted(PhoneAuthCredential credential) {
    if (GetPlatform.isAndroid == true) {
      _handlePhoneSignIn(credential);
    }
  }

  Future logOut()async{

    await FirebaseAuth.instance.signOut();

  }

}

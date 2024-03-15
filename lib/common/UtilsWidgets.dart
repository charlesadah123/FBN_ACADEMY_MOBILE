import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsWidgets{

  static mVerFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Failed'),
            content: Text('invalid-phone-number'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  static mCodeAutoRetrievalTimeout(String verificationId) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Timeout'),
          content: Text('Verification code auto-retrieval timed out.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


}
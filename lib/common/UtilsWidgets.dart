import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../services/AuthService.dart';

class UtilsWidgets {
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
          title: const Text('Timeout', style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w600)),
          content: const Text('Verification code auto-retrieval timed out.'),
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

  static verifyCodeBottomSheet(AuthService authService) async {

    final otpFormKey = GlobalKey<FormState>();

    TextEditingController? otp1Controller = TextEditingController();
    TextEditingController? otp2Controller = TextEditingController();
    TextEditingController? otp3Controller = TextEditingController();
    TextEditingController? otp4Controller = TextEditingController();
    TextEditingController? otp5Controller = TextEditingController();
    TextEditingController? otp6Controller = TextEditingController();

    FocusNode? otp1FocusNode = FocusNode();
    FocusNode? otp2FocusNode = FocusNode();
    FocusNode? otp3FocusNode = FocusNode();
    FocusNode? otp4FocusNode = FocusNode();
    FocusNode? otp5FocusNode = FocusNode();
    FocusNode? otp6FocusNode = FocusNode();

    otp1Controller!.addListener(() {
      if (otp1Controller!.text.isNotEmpty) {
        otp2FocusNode!.requestFocus();
      }
    });

    otp2Controller!.addListener(() {
      if (otp2Controller!.text.isNotEmpty) {
        otp3FocusNode!.requestFocus();
      }
    });

    otp3Controller!.addListener(() {
      if (otp3Controller!.text.isNotEmpty) {
        otp4FocusNode!.requestFocus();
      }
    });

    otp4Controller!.addListener(() {
      if (otp4Controller!.text.isNotEmpty) {
        otp5FocusNode!.requestFocus();
      }
    });

    otp5Controller!.addListener(() {
      if (otp5Controller!.text.isNotEmpty) {
        otp6FocusNode!.requestFocus();
      }
    });

    await showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return Form(
          key: otpFormKey,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Verify Otp",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    singleDigitWidget(otp1Controller, otp1FocusNode),
                    singleDigitWidget(otp2Controller, otp2FocusNode),
                    singleDigitWidget(otp3Controller, otp3FocusNode),
                    singleDigitWidget(otp4Controller, otp4FocusNode),
                    singleDigitWidget(otp5Controller, otp5FocusNode),
                    singleDigitWidget(otp6Controller, otp6FocusNode),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    var form = otpFormKey.currentState;

                    if (form!.validate()) {
                      String smsCode = otp1Controller!.text.trim() +
                          otp2Controller!.text.trim() +
                          otp3Controller!.text.trim() +
                          otp4Controller!.text.trim() +
                          otp5Controller!.text.trim() +
                          otp6Controller!.text.trim();

                      UserCredential? credential =
                          await authService.otpAuth(smsCode);
                      if (credential!.user != null) {
                       // Get.off(HomeScreen());
                      } else {
                        print("Error authenticating");
                      }
                    } else {
                      print("Empty state");
                    }
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ), // Add some spacing
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  static singleDigitWidget(
      TextEditingController? controller, FocusNode? focusNode) {
    return Container(
      width: 36,
      height: 48,
      color: Colors.transparent,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey)),
            helperText: ""),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

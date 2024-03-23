import 'package:fbn_academy_mobile/screens/widgets/FormFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/Constants.dart';

class AuthOther extends StatefulWidget {

   TextEditingController passwordController;

   TextEditingController otpController;

  AuthOther({super.key, required this.otpController, required this.passwordController});

  @override
  State<AuthOther> createState() => _AuthOtherState();
}

class _AuthOtherState extends State<AuthOther> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height*0.5,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF003B65),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FormFields(formLabel: "Otp Code", formHint: "Enter Otp Code", formController: widget.otpController),
              const SizedBox(height: 16),
              FormFieldPassword(formLabel: "Password", formHint: "Password", formController: widget.passwordController),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.back();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    backgroundColor: const Color(0xFFF0BD2D),
                  ),
                  child: Text('Verify', style: TextStyle(
                    color: MyStyles.colorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



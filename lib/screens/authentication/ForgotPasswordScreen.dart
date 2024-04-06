import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/Constants.dart';
import '../../controllers/AuthController.dart';
import '../widgets/FormFields.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthController _authCtrl = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password", style: TextStyle(
          color: MyStyles.colorPrimary,
       //   fontSize: 40,
          fontWeight: FontWeight.w600,
          height: 0,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FormFields(
                    formLabel: 'Email*',
                    formHint: 'abc@xyz.com',
                    formController: _emailController,),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed:() async{
                    if (_formKey.currentState!.validate()) {
                    await _authCtrl.forgotPassword(_emailController.text.trim());
                    Get.back();
                    }
                  },
                   style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            backgroundColor: MyStyles.colorSecondary,
            minimumSize: const Size(45.0, 45.0)),
                  child:  Text("Send Reset Email", style: TextStyle(
                    fontSize: 14.0,
                    color: MyStyles.colorPrimary,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fbn_academy_mobile/screens/authentication/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/FormFields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loginHeader(),
            const SizedBox(
              height: 40.0,
            ),
            formSection(),
            Align(
              alignment: Alignment.centerRight,
              child: forgotPassword(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            logInButton(),
            newHere(),
            const SizedBox(
              height: 10.0,
            ),

          ],
        ),
      ),
    ));
  }

  Widget loginHeader() {
    return const Column(
      children: [
        Center(
          child: Text('Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF003B65),
                fontSize: 40,
                fontWeight: FontWeight.w600,
                height: 0,
              )),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome back',
                  style: TextStyle(
                    color: Color(0xFF162D4C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.28,
                  )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget formSection() {
    return const Column(
      children: [
        FormFields(formLabel: 'Email*', formHint: 'abc@xyz.com'),
        FormFieldPassword(
            formLabel: 'Password*', formHint: 'Enter your password')
      ],
    );
  }

  Widget logInButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {

                Get.off(const LoginScreen());

            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                backgroundColor: const Color(0xFFF0BD2D),
                minimumSize: const Size(45.0, 45.0)),
            child: const Text(
              'Log in',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF162D4C),
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }

  Widget newHere() {
    return  GestureDetector(
      onTap: (){
        Get.off(RegisterScreen());
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New here?",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF162D4C),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Create an account',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFF0BD2D),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return   GestureDetector(
      onTap: (){
        print("forgot password clicked");
      },
      child: const Text('Forgot Password?',
                style: TextStyle(

                    fontSize: 14.0,
                    color: Color(0xFF162D4C),
                    decoration: TextDecoration.underline)),
    );

  }
}

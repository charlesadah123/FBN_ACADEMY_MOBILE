import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/FormFields.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
   const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
            child:  Column(
              children: [
                registerHeader(),
                const SizedBox(
                  height: 30.0,
                ),
                formSection(),
                const SizedBox(
                  height: 20.0,
                ),
                registerButton(),
                logInText(),
              ],
            ),
          ),
        ));
  }
}


  Widget formSection() {
    return  Column(
      children: [
        FormFields(formLabel: 'Full Name*', formHint: 'Enter Full Name'),
        FormFields(formLabel: 'Email*', formHint: 'abc@xyz.com'),
        FormFieldPassword(
            formLabel: 'Password*', formHint: 'Enter your password'),
      ],
    );
  }


Widget registerHeader() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30.0),
    child: Column(
      children: [
        Center(
          child: Text('Register',
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
          child: Center(
            child: Text('Welcome! Please fill in your credentials',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 14,

                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.28,
                )),
          ),
        )
      ],
    ),
  );
}

Widget registerButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              backgroundColor: const Color(0xFFF0BD2D),
              minimumSize: const Size(45.0, 45.0)),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF003B65),
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }

  Widget logInText() {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
          child: GestureDetector(
            onTap: (){
              Get.off(LoginScreen());
            },
            
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 14.0, color: Color(0xFF003B65)),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFF0BD2D),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ));
  }

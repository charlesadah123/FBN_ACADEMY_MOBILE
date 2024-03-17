import 'package:flutter/material.dart';
import 'loginScreen.dart';

class ScanFacePage extends StatelessWidget {
  const ScanFacePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(title: ''),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
        child: const Column(
          children: [
            RegisterHeader(
              register: 'Register',
              welcome: 'Welcome! Please fill in your credentials',
            ),
            FormSection(),
            ScanFace(),
            SignUp(),
            LogIn(alreadyHave: 'Already have an account?', logIn: 'Log in')
          ],
        ),
      ),
    ));
  }
}

class RegisterHeader extends StatelessWidget {
  const RegisterHeader(
      {super.key, required this.register, required this.welcome});

  final String register;
  final String welcome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Center(
            child: Text(register,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 40,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  height: 0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(welcome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF003B65),
                    fontSize: 14,
                    fontFamily: 'Gilroy',
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
}

class FormFields extends StatelessWidget {
  const FormFields(
      {super.key, required this.formLabel, required this.formHint});

  final String formLabel;
  final String formHint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(formLabel,
                style: const TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                )),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                hintText: formHint),
          )
        ],
      ),
    );
  }
}

class FormFieldPassword extends StatelessWidget {
  const FormFieldPassword(
      {super.key, required this.formLabel, required this.formHint});

  final String formLabel;
  final String formHint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(formLabel,
                style: const TextStyle(
                  color: Color(0xFF003B65),
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                )),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintStyle: const TextStyle(
                  fontSize: 12.0,
                ),
                hintText: formHint,
                suffixIcon: const Icon(Icons.visibility_outlined)),
          )
        ],
      ),
    );
  }
}

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FormFields(formLabel: 'Full Name*', formHint: 'Enter Full Name'),
        FormFields(formLabel: 'Email*', formHint: 'abc@xyz.com'),
        FormFieldPassword(
            formLabel: 'Password*', formHint: 'Enter your password'),
        FormFieldPassword(
            formLabel: 'Confirm Password*', formHint: 'Reenter your password')
      ],
    );
  }
}

class ScanFace extends StatelessWidget {
  const ScanFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF003B65)),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: const Size(45.0, 55.0)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.38,
                  child: Row(
                    children: [
                      Icon(Icons.face, color: Colors.black45),
                      SizedBox(width: 5.0),
                      Text('Scan Face ID',
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black45))
                    ],
                  ),
                ),
                SizedBox(width: 80.0),
                Column(
                  children: [
                    Icon(Icons.check_circle_outline_sharp),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
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
}

class LogIn extends StatelessWidget {
  const LogIn({super.key, required this.alreadyHave, required this.logIn});

  final String alreadyHave;
  final String logIn;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            alreadyHave,
            style: const TextStyle(fontSize: 14.0, color: Color(0xFF003B65)),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            logIn,
            style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFFF0BD2D),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    ));
  }
}

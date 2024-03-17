import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(
              login: 'Login',
              welcome: 'Welcome back, ',
              name: 'Charles!',
            ),
            FormSection(),
            LogInButton(logInText: 'Log in'),
            NewHere(newHere: "New here?", create: 'Create an account'),
            ForgotPassword(forgot: 'Forgot Password?')
          ],
        ),
      ),
    ));
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader(
      {super.key,
      required this.login,
      required this.welcome,
      required this.name});

  final String login;
  final String welcome;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Center(
            child: Text(login,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(welcome,
                    style: const TextStyle(
                      color: Color(0xFF162D4C),
                      fontSize: 14,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.28,
                    )),
                Text(name,
                    style: const TextStyle(
                      color: Color(0xFF162D4C),
                      fontSize: 14,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.28,
                    ))
              ],
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
                  color: Color(0xFF162D4C),
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
                  fontSize: 11.0,
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
                  color: Color(0xFF162D4C),
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
                suffixIcon: const Icon(Icons.visibility_outlined,
                    color: Colors.black45)),
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
        FormFields(formLabel: 'Email*', formHint: 'abc@xyz.com'),
        FormFieldPassword(
            formLabel: 'Password*', formHint: 'Enter your password')
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key, required this.logInText});

  final String logInText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
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
            child: Text(
              logInText,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF162D4C),
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}

class NewHere extends StatelessWidget {
  const NewHere({super.key, required this.newHere, required this.create});

  final String newHere;
  final String create;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            newHere,
            style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF162D4C),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            create,
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

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.forgot});

  final String forgot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Center(
        child: Text(forgot,
            style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF162D4C),
                decoration: TextDecoration.underline)),
      ),
    );
  }
}

// Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),
//       ),

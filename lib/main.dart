// ignore_for_file: unnecessary_new, avoid_print

import 'package:fbn_academy_mobile/controllers/AuthController.dart';
import 'package:fbn_academy_mobile/models/Record.dart';
import 'package:fbn_academy_mobile/screens/authentication/SplashScreen.dart';
import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:fbn_academy_mobile/services/BiometricService.dart';
import 'package:fbn_academy_mobile/services/LocationService.dart';
import 'package:fbn_academy_mobile/services/RecordService.dart';
import 'package:fbn_academy_mobile/services/RecordSettingService.dart';
import 'package:fbn_academy_mobile/services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'common/UtilServices.dart';
import 'controllers/UserController.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(UserController());
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        title: 'Attendance app',
        debugShowCheckedModeBanner: false,
        home: SplashScreen() //MyHomePage(title: "Testing",)
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth authFire = FirebaseAuth.instance;
  AuthService authService = AuthService();
  RecordService recordService = RecordService();
  RecordSettingService recordSettingService = RecordSettingService();
  UserService userService = UserService();
  BiometricService biometricService = BiometricService();
  LocationService locationService = LocationService();
  UtilServices uServices = UtilServices();
  TextEditingController smsCodeCtrl = new TextEditingController();

  String encrypted = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Encrypted: $encrypted"),
            ElevatedButton(
              onPressed: _sendOtp,
              child: const Text('Send OTP'),
            ),
            TextFormField(
              controller: smsCodeCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "verify otp"),
            ),
            ElevatedButton(
              onPressed: _verifyOtp,
              child: const Text('Verify OTP'),
            ),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text('Create User'),
            ),
            ElevatedButton(
              onPressed: _readUser,
              child: const Text('Read User'),
            ),
            ElevatedButton(
              onPressed: _updateUser,
              child: const Text('Update User'),
            ),
            ElevatedButton(
              onPressed: _deleteUser,
              child: const Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendOtp() async {
    await authService.verifyPhone(
        '+2348119546842'); // Replace with the phone number to send OT
  }

  void _verifyOtp() async {
    await authService.otpAuth(smsCodeCtrl.text.trim());
  }

  void _createUser() async {
    setState(() {
      print("inside set State");
    });
  }

  void _readUser() async {
    if (authFire.currentUser != null) {
      // Replace this with the actual user ID you want to read
      List<AttendanceRecord>? attendanceRecord =
          await recordService.getAllRecordById(0);
      print('record: ${attendanceRecord![0].toJsonString()}');
    } else {
      print("firebase user is null");
    }
  }

  void _updateUser() async {
    if (authFire.currentUser != null) {
      await recordService.updateRecord(AttendanceRecord(
          id: "-Nt5KrEEXwhV9zQfktj1",
          userId: authFire.currentUser!.uid,
          checkInTime: DateTime.now(),
          isPresent: true,
          isLate: false,
          isSickLeave: false,
          isOtherLeave: false,
          deviceToken: "666666",
          userToken: "-666666",
          updatedAt: DateTime.now(),
          createdAt: DateTime.now()));
    } else {
      print("firebase user is null");
    }
  }

  void _deleteUser() async {
    if (authFire.currentUser != null) {
      await recordService.deleteRecord(0);
      print('User deleted successfully');
    } else {
      print("firebase user is null");
    }
  }
}

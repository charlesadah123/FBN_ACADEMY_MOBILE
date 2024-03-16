import 'package:fbn_academy_mobile/common/Constants.dart';
import 'package:fbn_academy_mobile/models/Record.dart';
import 'package:fbn_academy_mobile/models/RecordSetting.dart';
import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:fbn_academy_mobile/services/BiometricService.dart';
import 'package:fbn_academy_mobile/services/LocationService.dart';
import 'package:fbn_academy_mobile/services/RecordService.dart';
import 'package:fbn_academy_mobile/services/RecordSettingService.dart';
import 'package:fbn_academy_mobile/services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'models/User.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController smsCodeCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _sendOtp,
              child: Text('Send OTP'),
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
              child: Text('Verify OTP'),
            ),
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Create User'),
            ),
            ElevatedButton(
              onPressed: _readUser,
              child: Text('Read User'),
            ),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Delete User'),
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
    // Replace these values with the actual user data you want to create
    if (authFire.currentUser != null) {
      await recordSettingService.createRecordSetting(
          RecordSetting(
          id: "first",
          startTime: DateTime(
              DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 06, 00),
          stopTime: DateTime(
              DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 80, 00),
          stopLateTime: DateTime(
              DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 09, 00),
          lat: 6.481096177043414,
          lon: 3.36125255460304,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      );
    }
    else {
      print("firebase user is null");
    }
  }

  void _readUser() async {
    if (authFire.currentUser != null) {
      // Replace this with the actual user ID you want to read
      List<AttendanceRecord>? attendanceRecord =
          await recordService.getAllRecordById(0);
      print('record: ${attendanceRecord![0]!.toJsonString()}');
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
          userToken: "666666",
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

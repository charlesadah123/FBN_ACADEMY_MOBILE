import 'package:fbn_academy_mobile/services/AuthService.dart';
import 'package:fbn_academy_mobile/services/BiometricService.dart';
import 'package:fbn_academy_mobile/services/LocationService.dart';
import 'package:fbn_academy_mobile/services/RecordService.dart';
import 'package:fbn_academy_mobile/services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

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
  AuthService authService = AuthService();
  RecordService recordService = RecordService();
  UserService userService = UserService();
  BiometricService biometricService = BiometricService();
  LocationService locationService = LocationService();
  TextEditingController smsCodeCtrl = new TextEditingController();

  String _authenticationResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _authenticateWithFingerprint,
              child: Text('Authenticate with Fingerprint'),
            ),
            ElevatedButton(
              onPressed: _authenticateWithFaceID,
              child: Text('Authenticate with Face ID'),
            ),
            SizedBox(height: 20),
            Text(_authenticationResult),
          ],
        ),
      ),
    );
  }

  void _authenticateWithFingerprint() async {
    bool isAuthenticated =
        await biometricService.fingerPrintAuth();
    setState(() {
      _authenticationResult = isAuthenticated
          ? 'Fingerprint authentication successful'
          : 'Fingerprint authentication failed';
    });
  }

  void _authenticateWithFaceID() async {
    bool isAuthenticated =
        await biometricService.faceIDAuth();
    setState(() {
      _authenticationResult = isAuthenticated
          ? 'Face ID authentication successful'
          : 'Face ID authentication failed';
    });
  }
}

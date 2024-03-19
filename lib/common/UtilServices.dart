import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../models/Record.dart';
import '../models/User.dart';
import 'Constants.dart';

class UtilServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  utilServices() {
    getFireUser();
  }

  void getFireUser() {
    user = auth.currentUser;
  }

  Future<Map<dynamic, dynamic>?> getdeviceinfo() async {
    Map<dynamic, dynamic?> mapDeviceInfo;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceid;

    if (GetPlatform.isAndroid == true) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceid = androidInfo.id + androidInfo.androidId;
      return mapDeviceInfo = {
        Dbkeys.deviceInfoMAINID: deviceid,
        Dbkeys.deviceInfoMODEL: androidInfo.model,
        Dbkeys.deviceInfoOS: 'android',
        Dbkeys.deviceInfoISPHYSICAL: androidInfo.isPhysicalDevice,
        Dbkeys.deviceInfoDEVICEID: androidInfo.id,
        Dbkeys.deviceInfoOSID: androidInfo.androidId,
        Dbkeys.deviceInfoOSVERSION: androidInfo.version.baseOS,
        Dbkeys.deviceInfoMANUFACTURER: androidInfo.manufacturer,
        Dbkeys.deviceInfoLOGINTIMESTAMP: DateTime.now().toIso8601String(),
      };
    } else if (GetPlatform.isIOS == true) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      deviceid = iosInfo.systemName + iosInfo.model + iosInfo.systemVersion;
      return mapDeviceInfo = {
        Dbkeys.deviceInfoMAINID: deviceid,
        Dbkeys.deviceInfoMODEL: iosInfo.model,
        Dbkeys.deviceInfoOS: 'ios',
        Dbkeys.deviceInfoISPHYSICAL: iosInfo.isPhysicalDevice,
        Dbkeys.deviceInfoDEVICEID: iosInfo.identifierForVendor,
        Dbkeys.deviceInfoOSID: iosInfo.name,
        Dbkeys.deviceInfoOSVERSION: iosInfo.name,
        Dbkeys.deviceInfoMANUFACTURER: iosInfo.name,
        Dbkeys.deviceInfoLOGINTIMESTAMP: DateTime.now().toIso8601String(),
      };
    }
  }

  String? encryptPassword(String password) {
    if (user != null) {

      // Encrypt the  information
      Uint8List encryptedBytes = _encrypt(password, MyConstants.encryptionKey2);

      // Convert the encrypted bytes to a hexadecimal string
      String encryptedHex = _bytesToString(encryptedBytes);

      return encryptedHex;
    }
    return null;
  }


  String? uniqueUserToken(AUser aUser) {
    if (user != null) {
      // Concatenate user information
      String userInfo =
          "${user!.uid}_${aUser.email}_${aUser.phone}_${aUser.fullName}_${DateTime.now().toIso8601String()}";

      // Encrypt the user information
      Uint8List encryptedBytes = _encrypt(userInfo, MyConstants.encryptionKey1);

      // Convert the encrypted bytes to a hexadecimal string
      String encryptedHex = _bytesToString(encryptedBytes);

      return encryptedHex;
    }
    return null;
  }

  Future<String?> uniqueDeviceToken() async {
    Map<dynamic, dynamic>? deviceInfo = await getdeviceinfo();

    if (user != null) {
      // Concatenate user information
      String device = "${deviceInfo![Dbkeys.deviceInfoMAINID]}_"
          "${deviceInfo![Dbkeys.deviceInfoDEVICEID]}_"
          "${deviceInfo![Dbkeys.deviceInfoDEVICENAME]}_"
          "${deviceInfo![Dbkeys.deviceInfoMODEL]}_"
          "${deviceInfo![Dbkeys.deviceInfoOSID]}_"
          "${deviceInfo![Dbkeys.deviceInfoOS]}";

      // Encrypt the user information
      Uint8List encryptedBytes = _encrypt(device, MyConstants.encryptionKey1);

      // Convert the encrypted bytes to a hexadecimal string
      String encryptedHex = _bytesToString(encryptedBytes);

      return encryptedHex;
    }
    return null;
  }

  Future<bool> isDeviceTokenUsed(String deviceToken) async {
    DatabaseReference dbRecords = FirebaseDatabase.instance.ref(DbPaths.records);

    DateTime startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      0,
      0,
      0,
    );

    DateTime endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      23,
      59,
      59,
    );

    try {
      DataSnapshot snapshot = await dbRecords
          .orderByChild('createdAt')
          .startAt(startTime.toIso8601String())
          .endAt(endTime.toIso8601String())
          .get();

      if (snapshot.exists) {
        Map<dynamic, dynamic> records = snapshot.value as Map<dynamic, dynamic> ;
        if (records != null) {
          // i don't trust this code
          for (var record in records.values) {
            if (record['deviceToken'] == deviceToken) {
              return true; // Device token is found, so it's used
            }
          }
        }
      }
    } catch (error) {
      print('Error fetching records: $error');
      // Handle the error as needed
    }

    return false; // Device token is not found within the specified time range
  }

  Uint8List _encrypt(String input, String key) {
    // Use HMAC (Hash-based Message Authentication Code) for encryption
    var hmac = Hmac(sha256, utf8.encode(key));
    return hmac.convert(utf8.encode(input)).bytes as Uint8List;
  }

  String _bytesToString(Uint8List encryptedBytes) {
    return encryptedBytes
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  String _generateEncryptionKey() {
    final random = Random.secure();
    final keyBytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(keyBytes);
  }

}

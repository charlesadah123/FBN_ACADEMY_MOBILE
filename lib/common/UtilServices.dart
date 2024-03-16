import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
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

  String? uniqueUserToken(AUser aUser) {
    if (aUser != null) {
      // Concatenate user information
      String userInfo = "${aUser.id}_${aUser.email}_${aUser.phone}_${aUser.fullName}_${DateTime.now().toIso8601String()}";

      // Encrypt the user information
      Uint8List encryptedBytes = encrypt(userInfo, MyConstants.encryptionKey1);

      // Convert the encrypted bytes to a hexadecimal string
      String encryptedHex =
          encryptedBytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join();

      return encryptedHex;
    }
    return null;
  }

  Uint8List encrypt(String input, String key) {
    // Use HMAC (Hash-based Message Authentication Code) for encryption
    var hmac = Hmac(sha256, utf8.encode(key));
    return hmac.convert(utf8.encode(input)).bytes as Uint8List;
  }

  String? uniqueDeviceToken( auser) {

    if(user!=null){








    }
  }

  Future<bool> hasDeviceBeenUsedForAuthentication() {
    // check if the token exist in firebase records based on the 8 am to 9am

  }

  String generateEncryptionKey() {
    final random = Random.secure();
    final keyBytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(keyBytes);
  }
}

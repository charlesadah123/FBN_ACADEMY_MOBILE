import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {

  static late String encryptionKey1;
  static late String encryptionKey2;
  static late String fcmServerKey;

  static Future<void> initialize() async {
    final String configString = await rootBundle.loadString('assets/config.json');
    final config = jsonDecode(configString);

    fcmServerKey = config['fcmServerKey'];
    encryptionKey1 = config['encryptionKey1'];
    encryptionKey2 = config['encryptionKey2'];

  }
}

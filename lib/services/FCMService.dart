import 'dart:convert';
import 'package:http/http.dart' as http;

import '../common/AppConfig.dart';

class FCMService {
  static  String serverKey = AppConfig.fcmServerKey;
  static const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  static Future<void> sendNotification(String title, String body, String token) async {
    final data = {
      'notification': {'title': title, 'body': body},
      'priority': 'high',
      'to': token,
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    try {
      final response = await http.post(Uri.parse(fcmUrl), headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print('Failed to send notification. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}

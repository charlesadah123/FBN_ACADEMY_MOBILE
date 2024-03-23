// ignore_for_file: file_names

import 'dart:convert';

class RecordSetting {
  final String id;
  final DateTime startTime;
  final DateTime stopTime;
  final DateTime stopLateTime;
  final double lat;
  final double lon;
  final DateTime createdAt;
  final DateTime updatedAt;

  RecordSetting(
      {required this.id,
      required this.startTime,
      required this.stopTime,
      required this.stopLateTime,
      required this.lat,
      required this.lon,
      required this.createdAt,
      required this.updatedAt});

  factory RecordSetting.fromJson(Map<dynamic, dynamic> json) {
    return RecordSetting(
      id: json['id'],
      startTime: DateTime.parse(json['startTime']),
      stopTime: DateTime.parse(json['stopTime']),
      stopLateTime: DateTime.parse(json['stopLateTime']),
      lat: json['lat'],
      lon: json['lon'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'stopTime': stopTime.toIso8601String(),
      'stopLateTime': stopLateTime.toIso8601String(),
      'lat': lat,
      'lon': lon,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Optional: Method to parse JSON string directly
  factory RecordSetting.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return RecordSetting.fromJson(jsonMap);
  }

  // Optional: Method to convert to JSON string directly
  String toJsonString() {
    return json.encode(toJson());
  }
}

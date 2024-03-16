import 'dart:convert';

class AttendanceRecord {
   String? id;
  final String userId;
  final DateTime checkInTime;
  final bool isPresent;
  final bool isLate;
  final bool isSickLeave;
  final bool isOtherLeave;
  final String deviceToken;
  final String userToken;
   DateTime? createdAt;
  final DateTime updatedAt;


  AttendanceRecord({
    this.id,
      required this.userId,
    required this.checkInTime,
    required this.isPresent,
    required this.isLate,
    required this.isSickLeave,
    required this.isOtherLeave,
    required this.deviceToken,
    required this.userToken,
      this.createdAt,
    required this.updatedAt});

  factory AttendanceRecord.fromJson(Map<dynamic, dynamic> json) {
    return AttendanceRecord(
      id: json['id'],
      userId: json['userId'] ,
      checkInTime: DateTime.parse(json['checkInTime']),
      isPresent: json['isPresent'] ,
      isLate: json['isLate'] ,
      isSickLeave: json['isSickLeave'] ,
      isOtherLeave: json['isOtherLeave'],
      updatedAt:  DateTime.parse(json['updatedAt']),
      createdAt:DateTime.parse(json['createdAt']),
      deviceToken: json['deviceToken'],
      userToken:  json['userToken'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'checkInTime': checkInTime.toIso8601String(),
      'isPresent': isPresent,
      'isLate': isLate,
      'isSickLeave': isSickLeave,
      'isOtherLeave': isOtherLeave,
      'updatedAt' :updatedAt.toIso8601String(),
      'createdAt': createdAt!.toIso8601String(),
      'deviceToken': deviceToken,
      'userToken':userToken,
    };
  }

  // Optional: Method to parse JSON string directly
  factory AttendanceRecord.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return AttendanceRecord.fromJson(jsonMap);
  }

  // Optional: Method to convert to JSON string directly
  String toJsonString() {
    return json.encode(toJson());
  }
}

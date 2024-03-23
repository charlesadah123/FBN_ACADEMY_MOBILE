import 'package:flutter/material.dart';

class MyConstants{


  static double firstAcademyLong=3.36125255460304;
  static double firstAcademyLat=6.481096177043414;



  static String encryptionKey1 = "ZGRgMOnXZHCP7tf0m6SCwbmZfT5XpZrXG_c7jyHovCY=";
  static String encryptionKey2 = "C5scNNiglRAF-b-EjmqH7XfbewEGxkXzF2n7fRbab-0=";
}
class DbPaths{

  static const String users = "users";
  static const String records = "records";
  static const String recordSetting = "recordSetting";
}
class Dbkeys {
  //------- device info

  static const String deviceInfoMAINID = 'MAIN_ID';
  static const String deviceInfoDEVICEID = 'Device_ID';
  static const String deviceInfoOSID = 'Os_ID';
  static const String deviceInfoMODEL = 'Model';
  static const String deviceInfoOSVERSION = 'OS_version';
  static const String deviceInfoOS = 'OS_type';
  static const String deviceInfoDEVICENAME = 'Device_name';
  static const String deviceInfoMANUFACTURER = 'Manufacturer';
  static const String deviceInfoLOGINTIMESTAMP = 'Device_login_Time';
  static const String deviceInfoISPHYSICAL = 'Is_Physical';

}

class MyStyles{

  static Color colorPrimary= const Color(0xFF003B65);
  static Color colorSecondary=  const Color(0xFFF0BD2D);

}

enum AuthType{
 otp_password,
 biometric
}
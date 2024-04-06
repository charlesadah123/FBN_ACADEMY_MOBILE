import 'package:flutter/material.dart';

class MyConstants{

  static double firstAcademyLong=3.36125255460304;
  static double firstAcademyLat=6.481096177043414;


/*
  //david
  static double firstAcademyLong=-122.406417;
  static double firstAcademyLat=37.785834;
*/



/*
  sir kay
  static double firstAcademyLong=-122.406417;
  static double firstAcademyLat=37.785834;
   */


/*
 sir light
  static double firstAcademyLong=7.412648;
  static double firstAcademyLat=3.933891;
 */

  static const String dateFormat2 = 'HH:mm';
  static const String dateFormat3 = 'dd/MM/yyyy';

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
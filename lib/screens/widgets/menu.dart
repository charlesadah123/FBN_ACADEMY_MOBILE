import 'package:fbn_academy_mobile/common/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AuthController.dart';
import '../../controllers/DashboardController.dart';
import '../dashboard/TakeAttendanceScreen.dart';
import '../profile/ProfileScreen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  AuthController authCtrl = Get.find();
  DashboardController dashCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // close button
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child:  Icon(
                Icons.close,
                color: MyStyles.colorPrimary,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        await authCtrl.logOut();
                      },
                      child: Text("Log Out",
                          style:  TextStyle(
                            color: MyStyles.colorPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ))),
                  TextButton(
                      onPressed: () async {
                        Get.to(ProfileScreen());
                      },
                      child:  Text("My Profile",
                          style: TextStyle(
                            color: MyStyles.colorPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ))),
                  TextButton(
                      onPressed: () {},
                      child: Text("Meet the team",
                          style:  TextStyle(
                            color: MyStyles.colorPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ))),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await dashCtrl.checkDeviceToken();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        backgroundColor: MyStyles.colorSecondary,
                      ),
                      child:  Text(
                        'Take Attendance',
                        style: TextStyle(
                          color: MyStyles.colorPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

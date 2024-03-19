import 'package:fbn_academy_mobile/screens/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceSuccess extends StatefulWidget {
  const AttendanceSuccess({super.key});

  @override
  State<AttendanceSuccess> createState() => _AttendanceSuccessState();
}

class _AttendanceSuccessState extends State<AttendanceSuccess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Adjusted height or remove if not needed
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Container(
                          width: 95,
                          height: 95,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/user.png",
                              ),
                              fit: BoxFit.cover,
                              opacity: 0.34,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Icon(
                          Icons.task_alt_outlined,
                          color: Colors.yellow[700],
                          size: 38,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12), // Adjusted height or remove if not needed
                const Text(
                  "Attendance Marked Successfully",
                  style: TextStyle(color: Color(0xFF003B65), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40), // Adjusted height or remove if not needed
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.to(DashboardScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      backgroundColor: Color(0xFF003B65),
                    ),
                    child: const Text(
                      'Go To Dashboard',
                      style: TextStyle(
                        color: Color(0xFFF0BD2D),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Adjusted height or remove if not needed
              ],
            ),
          ],
        ),
      ),
    );

  }
}

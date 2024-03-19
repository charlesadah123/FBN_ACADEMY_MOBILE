import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/TakeAttendanceScreen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // close button
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: Color(0xFF003B65),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  TextButton(onPressed: (){

                  },
                      child:Text("Log Out", style: const TextStyle(
                          color: Color(0xFF003B65),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ))
                  ),

                  TextButton(onPressed: (){

                  },
                      child:Text("Meet the team", style: const TextStyle(
                        color: Color(0xFF003B65),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ))
                  ),
                  const SizedBox(height: 13,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const TakeAttendanceScreen();
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        backgroundColor: const Color(0xFFF0BD2D),
                      ),
                      child: const Text(
                        'Take Attendance',
                        style: TextStyle(
                          color: Color(0xFF003B65),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
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

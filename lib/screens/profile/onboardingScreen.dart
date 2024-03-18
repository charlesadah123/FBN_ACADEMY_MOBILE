import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 19,
                height: 6,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xffffbc00),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Container(
                width: 19,
                height: 6,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xffd9d9d9)
                ),
              ),
               const SizedBox(
                width: 5.0,
              ),
              Container(
                width: 19,
                height: 6,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xffd9d9d9))
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Container(
            width: 290,
            height: 257,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff162d4c),
              image: const DecorationImage(
                image: AssetImage("assets/images/fingerprint.png"),
                fit: BoxFit.scaleDown,
            )
          ),
        )
      ),
        Container(
          padding: const EdgeInsets.only(top: 25.0),
          child: const Column( 
            children: [
              Text(
                "Automated Attendance",
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )
             ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Efficient attendance tracking system with advanced biometric (Fingerprint) technology.",   
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )
             ),
             Row(
              children: [
                SizedBox(),
                SizedBox()
              ],
             )
            ],
          )
        ), 
    ]
  );
  }
}
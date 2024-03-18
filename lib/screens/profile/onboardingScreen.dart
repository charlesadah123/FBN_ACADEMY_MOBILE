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
          padding: const EdgeInsets.only(top: 50.0),
          child: const Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Automated Attendance",
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )
             ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                "Efficient attendance tracking system with ",   
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )
             ),
              ),
               Align(
                alignment: Alignment.center,
                child: Text(
                "advanced biometric (Fingerprint) technology. ",   
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )
             ),
              ),
              
            ],
          )
        ),
      Container(
        padding: const EdgeInsets.only(top: 75.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
                "Skip",   
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              )
             ),
             const SizedBox(
              width: 25
             ),
            ElevatedButton(
              onPressed: (){},
              child: const Icon(Icons.arrow_right),
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF0BD2D), 
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),// Hex color code for #F0BD2D
            ),
            )
          ],
        ),
      ),
    ]
  );
  }
}
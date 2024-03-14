// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                children: [
                  Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14, bottom: 14, left: 21, right: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.grey[600],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 107,
                                  height: 33,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 74,
                                        top: 0,
                                        child: SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Opacity(
                                                  opacity: 0.40,
                                                  child: Container(
                                                      width: 33,
                                                      height: 33,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFFF2F4F8),
                                                        shape: OvalBorder(),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .notifications_outlined,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 37,
                                        top: 0,
                                        child: SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Opacity(
                                                  opacity: 0.40,
                                                  child: Container(
                                                      width: 33,
                                                      height: 33,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFFF2F4F8),
                                                        shape: OvalBorder(),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .chat_bubble_outline_rounded,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Opacity(
                                                  opacity: 0.40,
                                                  child: Container(
                                                      width: 33,
                                                      height: 33,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFFF2F4F8),
                                                        shape: OvalBorder(),
                                                      ),
                                                      child: const Icon(
                                                        Icons.search,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 1, // Width of the vertical line
                                  height: 33, // Height of the vertical line
                                  color: const Color(0x26162D4C),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 37.83,
                                  height: 37.83,
                                  decoration: const ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://picsum.photos/id/237/200/300"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 39),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Attendance \nOverview',
                          style: TextStyle(
                            color: Color(0xFF003B65),
                            fontSize: 24,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: 169,
                          height: 46,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.calendar_today_outlined,
                                    color: Colors.black),
                                Text(
                                  'Dec 24 - Feb 09',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          height: 130,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Opacity(
                                        opacity: 0.50,
                                        child: Text(
                                          'Total days\nAttended',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 34,
                                        height: 33,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              child: Container(
                                                width: 34,
                                                height: 33,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0x0FF0BD2D),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 5,
                                              top: 5,
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                child: Stack(children: [
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color: Colors.yellow[700],
                                                  )
                                                ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '22',
                                        style: TextStyle(
                                          color: Color(0xFF003B65),
                                          fontSize: 36,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/30',
                                        style: TextStyle(
                                          color: Color(0x51003B65),
                                          fontSize: 20,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 130,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Opacity(
                                        opacity: 0.50,
                                        child: Text(
                                          'Last\nChecked In',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 34,
                                        height: 33,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              child: Container(
                                                width: 34,
                                                height: 33,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0x0FF0BD2D),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 5,
                                              top: 5,
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                child: Stack(children: [
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color: Colors.yellow[700],
                                                  )
                                                ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '7:30am',
                                  style: TextStyle(
                                    color: Color(0xFF003B65),
                                    fontSize: 32,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      width: 400,
                      height: 320,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0x0F003B65)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x06000000),
                            blurRadius: 6.52,
                            offset: Offset(0, 1.79),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 187,
                            height: 187,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 187,
                                    height: 187,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 187,
                                            height: 187,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFF0BD2D),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 187,
                                            height: 187,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF003B65),
                                              shape: OvalBorder(),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x11000000),
                                                  blurRadius: 13,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 84,
                                  height: 35,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFEBEBEB)),
                                      borderRadius:
                                          BorderRadius.circular(17.50),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFF003B65),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      const Opacity(
                                        opacity: 0.80,
                                        child: Text(
                                          'Present',
                                          style: TextStyle(
                                            color: Color(0xFF003B65),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 84,
                                  height: 35,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFFEBEBEB)),
                                      borderRadius:
                                          BorderRadius.circular(17.50),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFF0BD2D),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      const Opacity(
                                        opacity: 0.80,
                                        child: Text(
                                          'Absent',
                                          style: TextStyle(
                                            color: Color(0xFFF0BD2D),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

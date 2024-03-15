// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable

import 'package:fl_chart/fl_chart.dart';
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
                  // this is the search bar widget
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
                  // this is the attendance & calender widget
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
                  // this is the days attended & check in time widget
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
                  // this contains the pie chart widget
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
                          // this is the pie chart widget container
                          Container(
                            width: 187,
                            height: 187,
                            child: const Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '75%',
                                  style: TextStyle(
                                    color: Color(0xFF003B65),
                                    fontSize: 36,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                                AttendancePieChart(),
                                // Positioned(
                                //   child: Container(
                                //     width: 187,
                                //     height: 187,
                                //     child: Stack(
                                //       children: [
                                //         Positioned(
                                //           child: Container(
                                //             width: 187,
                                //             height: 187,
                                //             decoration: const ShapeDecoration(
                                //               color: Color(0xFFF0BD2D),
                                //               shape: OvalBorder(),
                                //             ),
                                //           ),
                                //         ),
                                //         Positioned(
                                //           child: Container(
                                //             width: 187,
                                //             height: 187,
                                //             decoration: const ShapeDecoration(
                                //               color: Color(0xFF003B65),
                                //               shape: OvalBorder(),
                                //               shadows: [
                                //                 BoxShadow(
                                //                   color: Color(0x11000000),
                                //                   blurRadius: 13,
                                //                   offset: Offset(0, 2),
                                //                   spreadRadius: 0,
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
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
                  ),
                  // this is the list of absentee leaves
                  const AbsenteeLeaveSection(
                    absenteeReason: ['Lateness', 'Sick Leaves', 'Other Leaves'],
                    numberOfDays: ['1 Day', '2 Days', '0 Day'],
                  ),
                  // this is the take attendance button
                  Container(
                    padding: const EdgeInsets.only(),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const Placeholder();
                            })
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          backgroundColor: const Color(0xFFF0BD2D),
                          minimumSize: const Size(10.0, 44.0)),
                      child: const Text(
                        'Take Attendance',
                        style: TextStyle(
                          color: Color(0xFF003B65),
                          fontSize: 16,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
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

class AttendancePieChart extends StatelessWidget {
  const AttendancePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 750),
      swapAnimationCurve: Curves.easeInOutQuint,
      PieChartData(sections: [
        // present
        PieChartSectionData(
          value: 75,
          color: const Color(0xFF003B65),
        ),

        // absent
        PieChartSectionData(
          value: 25,
          color: const Color(0xFFF0BD2D),
        ),
      ]),
    );
  }
}

class AbsenteeLeaveSection extends StatelessWidget {
  const AbsenteeLeaveSection(
      {super.key, required this.absenteeReason, required this.numberOfDays});

  final List<String> absenteeReason;
  final List<String> numberOfDays;

  // Map each reason for absence to its corresponding icon
  static Map<String, Icon> reasonsForAbsence = {
    'Lateness': const Icon(Icons.alarm, color: Color(0xFFF0BD2D)),
    'Sick Leaves': const Icon(Icons.sick_outlined, color: Color(0xFFF0BD2D)),
    'Other Leaves': const Icon(Icons.list_alt, color: Color(0xFFF0BD2D)),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: absenteeReason.length,
              itemBuilder: (context, index) {
                final reasonOfAbsence = absenteeReason[index];
                final daysOfAbsence = numberOfDays[index];
                final reasonIcon = reasonsForAbsence[reasonOfAbsence];

                return FadeIn(
                  // Delay each item's animation
                  delay: Duration(milliseconds: index * 100),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: 100,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color:
                                Colors.black.withOpacity(0.05999999865889549),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 29.0, right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: reasonIcon ??
                                      const Icon(
                                        Icons.alarm,
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  reasonOfAbsence,
                                  style: const TextStyle(
                                    color: Color(0xFF003B65),
                                    fontSize: 18,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 29.0),
                            child: Opacity(
                              opacity: 0.4,
                              child: Text(
                                daysOfAbsence,
                                style: const TextStyle(
                                  color: Color(0xFF003B65),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class FadeIn extends StatefulWidget {
  const FadeIn({super.key, required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Adjust animation duration
      // Adjust reverse animation duration
      reverseDuration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Adjust animation curve
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

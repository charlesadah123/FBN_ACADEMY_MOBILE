import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/ChartData.dart';
import '../widgets/menu.dart';
import 'TakeAttendanceScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //shoot menu bottom sheet here
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Menu();
                });
          },
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF003B65),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                //  shoot profile screen
              },
              child: Container(
                width: 37.83,
                height: 37.83,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/id/237/200/300"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19, bottom: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // this is the attendance & calender widget
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attendance \nOverview',
                    style: TextStyle(
                      color: Color(0xFF003B65),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              color: Color(0xFF003B65), size: 16),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Dec 24 - Feb 09',
                            style: TextStyle(
                              color: Color(0xFF003B65),
                              fontSize: 12,
                            ),
                          ),
                        ]),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              // this is the days attended & check in time widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // this is the total days attended container
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            3), // Set border radius to zero
                      ),
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        child: Center(
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
                                          fontSize: 12,
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
                                              width: 25,
                                              height: 25,
                                              decoration: ShapeDecoration(
                                                color: const Color(0x0FF0BD2D),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 8,
                                            top: 8,
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              child:
                                                Icon(
                                                  Icons.task_alt_outlined,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '22',
                                      style: TextStyle(
                                        color: Color(0xFF003B65),
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/30',
                                      style: TextStyle(
                                        color: Color(0x51003B65),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            4), // Set border radius to zero
                      ),
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Opacity(
                                    opacity: 0.50,
                                    child: Text(
                                      'Last\nChecked In',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
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
                                            width: 25,
                                            height: 25,
                                            decoration: ShapeDecoration(
                                              color: const Color(0x0FF0BD2D),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2)),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 8,
                                          top: 8,
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            child: Icon(
                                                Icons.task_alt_outlined,
                                                color: Colors.yellow[700],
                                                size: 18,
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '7:30am',
                                style: TextStyle(
                                  color: Color(0xFF003B65),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // this contains the pie chart widget
              Stack(
                alignment: Alignment.center,
                children: [
                  myChart(), // Display your myChart() widget first
                  Positioned(
                    top: 74, // Position the text widget to fill the stack
                    child: Text(
                      '75%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF003B65),
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              // this is the list of absentee leaves
              const AbsenteeLeaveSection(
                absenteeReason: ['Lateness', 'Sick Leaves', 'Other Leaves'],
                numberOfDays: ['1 Day', '2 Days', '0 Day'],
              ),

              const SizedBox(height: 10),
              // this is the take attendance button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return TakeAttendanceScreen();
                        })
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // add padding after attendance button for accesibility
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget myChart() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // Set border radius to zero
        ),
        color: Colors.white,
        elevation: 1,
        child: Center(
            child: SizedBox(height: 230, child: _buildRoundedDoughnutChart())));
  }

  SfCircularChart _buildRoundedDoughnutChart() {
    return SfCircularChart(
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: _getRoundedDoughnutSeries(),
    );
  }

  List<DoughnutSeries<ChartData, String>> _getRoundedDoughnutSeries() {
    final List<ChartData> chartData = <ChartData>[
      ChartData(x: 'Present', y: 70),
      ChartData(x: 'Absent', y: 10),
    ];

    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        pointColorMapper: (ChartData data, _) {
          // Return yellow color for 'Present' and blue color for 'Absent'
          return data.x == 'Present' ? Color(0xFF003B65) : Colors.yellow[700];
        },
        dataSource: chartData,
        animationDuration: 0,
        cornerStyle: CornerStyle.bothCurve,
        radius: '85%',
        innerRadius: '80%',
        xValueMapper: (ChartData data, _) => data.x as String,
        yValueMapper: (ChartData data, _) => data.y,
      ),
    ];
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: absenteeReason.length,
              itemBuilder: (context, index) {
                final reasonOfAbsence = absenteeReason[index];
                final daysOfAbsence = numberOfDays[index];
                final reasonIcon = reasonsForAbsence[reasonOfAbsence];

                return Column(
                  children: [
                    FadeIn(
                      // Delay each item's animation
                      delay: Duration(milliseconds: index * 100),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              3), // Set border radius to zero
                        ),
                        color: Colors.white,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 20,),
                                  Container(
                                      child: reasonIcon),
                                  SizedBox(width: 10,),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Text(
                                      reasonOfAbsence,
                                      style: const TextStyle(
                                        color: Color(0xFF003B65),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Opacity(
                                    opacity: 0.4,
                                    child: Text(
                                      daysOfAbsence,
                                      style: const TextStyle(
                                        color: Color(0xFF003B65),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                     ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
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

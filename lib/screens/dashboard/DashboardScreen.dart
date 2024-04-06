import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:fbn_academy_mobile/common/UtilsWidgets.dart';
import 'package:fbn_academy_mobile/controllers/DashboardController.dart';
import 'package:fbn_academy_mobile/controllers/UserController.dart';
import 'package:fbn_academy_mobile/screens/dashboard/AbsenteeLeaveSection.dart';
import 'package:fbn_academy_mobile/screens/dashboard/RecordsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../common/Constants.dart';
import '../../models/ChartData.dart';
import '../../models/Record.dart';
import '../profile/ProfileScreen.dart';
import '../widgets/DurationSelectionWidget.dart';
import '../widgets/menu.dart';
import 'TakeAttendanceScreen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  DashboardController dashCtrl = Get.put(DashboardController());
  UserController userCtrl = Get.find<UserController>();

  late int present;
  late int absent;
  late String checkIn;
  late int sickLeave;
  late int lateness;
  late int otherLeave;
  late List<AttendanceRecord> absentRecord;
  late List<AttendanceRecord> sickRecord;
  late List<AttendanceRecord> latenessRecord;
  late List<AttendanceRecord> otherRecord;

  @override
  void initState() {
    super.initState();
  }

  void getStats() {
    var statistics = dashCtrl.statistics.value;

    present = statistics['totalDaysPresent'] ?? 0;
    absent = statistics['totalDaysAbsent'] ?? 0;
    checkIn = statistics['lastCheckInTime'] != null
        ? UtilServices.formatDateTime(statistics['lastCheckInTime']!)
        : "None";
    sickLeave = statistics['totalSickLeaveDays'] ?? 0;
    lateness = statistics['totalLatenessDays'] ?? 0;
    otherLeave = statistics['totalOtherLeaveDays'] ?? 0;

    absentRecord = statistics['absentRecords'];
    sickRecord = statistics['sickRecords'];
    latenessRecord = statistics['latenessRecords'];
    otherRecord = statistics['otherRecords'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          icon: Icon(
            Icons.menu,
            color: MyStyles.colorPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return GestureDetector(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: SizedBox(
                    width: 26,
                    height: 26,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: (userCtrl.imageUrl!.value.length == 0)
                          ? const AssetImage('assets/images/profileUser.png')
                              as ImageProvider<Object>
                          : NetworkImage(userCtrl.imageUrl!.value),
                    )),
              );
            }),
          ),
          IconButton(
            onPressed: () {
              Get.to(RecordsScreen(
                  pageTitle: "Attendance History",
                  records: dashCtrl.records.value));
            },
            icon: Icon(
              Icons.calendar_month,
              color: MyStyles.colorPrimary,
            ),
          ),
        ],
      ),
      body: Obx(() {
        return dashCtrl.dashLoading.value
            ? SizedBox(
                height: Get.height,
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MyStyles.colorPrimary)),
                ))
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 19, right: 19, bottom: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // this is the attendance & calender widget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Attendance \nOverview',
                            style: TextStyle(
                              color: MyStyles.colorPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          DurationSelectionWidget(
                            onDurationSelected: (startDate) {
                              // Update statistics based on selected start date
                              dashCtrl.calculateStatistics(duration: startDate);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        getStats();
                        return Column(
                          children: <Widget>[
                            buildAttendanceOverview(),
                            const SizedBox(height: 20),
                            dashCtrl.records.value.isNotEmpty
                                ? buildChart()
                                :  Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text("No Chart Data Available",
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                ),
                            const SizedBox(height: 20),
                            buildAbsenteeLeaveSection(),
                            const SizedBox(height: 10),
                            SizedBox(
                                width: double.infinity,
                                child: buildTakeAttendanceButton()),
                          ],
                        );
                      }),

                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              );
      }),
    );
  }

  Widget buildAttendanceOverview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTotalDaysAttendedCard(),
        const SizedBox(width: 4),
        buildLastCheckedInCard(),
      ],
    );
  }

  Widget buildTotalDaysAttendedCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildOpacityText('Total days\nAttended'),
                  UtilsWidgets.checkedBadge(),
                ],
              ),
              const SizedBox(height: 5),
              buildAttendanceText(present, 'day', 'days'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLastCheckedInCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildOpacityText('Last\nChecked In'),
                  UtilsWidgets.checkedBadge(),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                dashCtrl.records.value.isNotEmpty ? checkIn : "N/A",
                style: TextStyle(
                  color: MyStyles.colorPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOpacityText(String text) {
    return Opacity(
      opacity: 0.50,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildAttendanceText(int value, String singular, String plural) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$value',
            style: TextStyle(
              color: MyStyles.colorPrimary,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: value == 1 ? ' $singular' : ' $plural',
            style: TextStyle(
              color: MyStyles.colorPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        myChart(present, absent), // Display your myChart() widget first
        Positioned(
          top: 74,
          child: Text(
            '${(present / (present + absent)) * 100}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyStyles.colorPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAbsenteeLeaveSection() {
    return AbsenteeLeaveSection(
      absenteeReason: const [
        'Absent',
        'Lateness',
        'Sick Leaves',
        'Other Leaves'
      ],
      numberOfDays: [
        '$absent ${absent == 1 ? 'day' : 'days'}',
        '$lateness ${lateness == 1 ? 'day' : 'days'}',
        '$sickLeave ${sickLeave == 1 ? 'day' : 'days'}',
        '$otherLeave ${otherLeave == 1 ? 'day' : 'days'}'
      ],
      absenteeFunctions: [
        () {
          Get.to(RecordsScreen(records: absentRecord, pageTitle: "Absents"));
        },
        () {
          Get.to(RecordsScreen(records: latenessRecord, pageTitle: "Lateness"));
        },
        () {
          Get.to(RecordsScreen(records: sickRecord, pageTitle: "Sick Leaves"));
        },
        () {
          Get.to(
              RecordsScreen(records: otherRecord, pageTitle: "Other Leaves"));
        },
      ],
    );
  }

  Widget buildTakeAttendanceButton() {
    return ElevatedButton(
      onPressed: () async {
        await dashCtrl.checkDeviceToken();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        backgroundColor: MyStyles.colorSecondary,
      ),
      child: Text(
        'Take Attendance',
        style: TextStyle(
          color: MyStyles.colorPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget myChart(int present, int absent) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3), // Set border radius to zero
        ),
        color: Colors.white,
        elevation: 1,
        child: Center(
            child: SizedBox(
                height: 230,
                child: _buildRoundedDoughnutChart(present, absent))));
  }

  SfCircularChart _buildRoundedDoughnutChart(int present, int absent) {
    return SfCircularChart(
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: _getRoundedDoughnutSeries(present, absent),
    );
  }

  List<DoughnutSeries<ChartData, String>> _getRoundedDoughnutSeries(
      int present, int absent) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(x: 'Present', y: present),
      ChartData(x: 'Absent', y: absent),
    ];

    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        pointColorMapper: (ChartData data, _) {
          // Return yellow color for 'Present' and blue color for 'Absent'
          return data.x == 'Present'
              ? MyStyles.colorPrimary
              : MyStyles.colorSecondary;
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

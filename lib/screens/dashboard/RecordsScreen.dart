import 'package:fbn_academy_mobile/common/Constants.dart';
import 'package:fbn_academy_mobile/common/UtilServices.dart';
import 'package:flutter/material.dart';

import '../../models/Record.dart';

class RecordsScreen extends StatefulWidget {
  List<AttendanceRecord> records;
  String pageTitle;

  RecordsScreen({super.key, required this.records, required this.pageTitle});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle, style: TextStyle(color: MyStyles.colorPrimary),),
      ),
      body: widget.records.isNotEmpty
          ? ListView.builder(
              itemCount: widget.records.length,
              itemBuilder: (context, index) {
                final record = widget.records[index];
                String created = UtilServices.dateToString(record.createdAt!, MyConstants.dateFormat3);
                String checkInTime= UtilServices.formatDateTime(record.checkInTime!);
                String checkInText = record.isPresent
                    ? 'Present  at $checkInTime'
                    : 'Absent';
                return ListTile(

                  title: Text(created),
                  subtitle: Text(checkInText),
                  leading: CircleAvatar(
                    backgroundColor:
                        record.isPresent ? Colors.green : Colors.red,
                    child: Icon(
                      record.isPresent ? Icons.check : Icons.close,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
              "No Record",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
    );
  }
}

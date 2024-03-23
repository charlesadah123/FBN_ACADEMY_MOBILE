// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/Constants.dart'; // Import Get library

class DurationSelectionWidget extends StatefulWidget {
  final Function(Duration) onDurationSelected;

  const DurationSelectionWidget({Key? key, required this.onDurationSelected})
      : super(key: key);

  @override
  _DurationSelectionWidgetState createState() =>
      _DurationSelectionWidgetState();
}

class _DurationSelectionWidgetState extends State<DurationSelectionWidget> {
  final List<int> durations = [30, 60]; // Durations in days

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<int>(
        decoration: const InputDecoration(
          border: InputBorder.none,
          // Example fill color
        ),
        value: durations.first, // Default to 30 days
        onChanged: (int? newValue) {
          if (newValue != null) {
            final startDate = DateTime.now().subtract(Duration(days: newValue));
            final selectedDuration = DateTime.now().difference(startDate);
            widget.onDurationSelected(
                selectedDuration); // Pass the difference as Duration
          }
        },
        items: durations.map<DropdownMenuItem<int>>((int duration) {
          final startDate = DateTime.now().subtract(Duration(days: duration));
          final displayText =
              '${startDate.day} ${DateFormat.MMM().format(startDate)}  ($duration Days)';
          return DropdownMenuItem<int>(
            value: duration,
            child: Row(children: [
              Icon(Icons.calendar_today_outlined,
                  color: MyStyles.colorPrimary, size: 16),
              const SizedBox(
                width: 5,
              ),
              Text(
                displayText,
                style: TextStyle(
                  color: MyStyles.colorPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}

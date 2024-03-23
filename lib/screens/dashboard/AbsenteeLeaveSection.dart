import 'package:fbn_academy_mobile/screens/dashboard/FadeIn.dart';
import 'package:flutter/material.dart';

import '../../common/Constants.dart';

class AbsenteeLeaveSection extends StatelessWidget {
  const AbsenteeLeaveSection(
      {super.key, required this.absenteeReason, required this.numberOfDays});

  final List<String> absenteeReason;
  final List<String> numberOfDays;

  // Map each reason for absence to its corresponding icon
  static Map<String, Icon> reasonsForAbsence = {
    'Lateness':  Icon(Icons.alarm, color: MyStyles.colorSecondary),
    'Sick Leaves':  Icon(Icons.sick_outlined, color: MyStyles.colorSecondary),
    'Other Leaves':  Icon(Icons.list_alt, color: MyStyles.colorSecondary),
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
                                      style:  TextStyle(
                                        color: MyStyles.colorPrimary,
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
                                    style:  TextStyle(
                                      color: MyStyles.colorPrimary,
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
                    const SizedBox(
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

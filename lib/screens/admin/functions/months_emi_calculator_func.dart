// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../admin_common_files.dart';

void approvedMonthAndEMIMonthsListCreator() {
  // Timestamp times = Timestamp.now();

// Replace this with your actual timestamp
  Timestamp timestampForLoanApproveScreen = Timestamp.now();

  // Convert Timestamp to DateTime
  DateTime dateTimeCoverted = timestampForLoanApproveScreen.toDate();

  // Get the current month name and year from the DateTime object
  formattedDate = DateFormat('MMM y').format(dateTimeCoverted);

  // Print the current month and year
  print('Current Month and Year: $formattedDate');

  // Add 2 months to the current DateTime
  // DateTime startDate =
  //     DateTime(dateTime.year, dateTime.month + 2, dateTime.day);

  // print(startDate);
  DateTime currentMonth;

  // Get the month name and year for the future date
  // String formattedFutureDate = DateFormat('MMM y').format(startDate);



  // Generate a list of strings for the next 10 months
  for (int i = 0; i < 10; i++) {
     currentMonth =
        DateTime(dateTimeCoverted.year, dateTimeCoverted.month + 2 + i, dateTimeCoverted.day);
    String formattedMonth = DateFormat('MMM y').format(currentMonth);
    monthsList.add(formattedMonth);
    print(monthsList);
  }

  // Print the future month and year
  // print('Future Month and Year (+2 months): $formattedFutureDate');
}
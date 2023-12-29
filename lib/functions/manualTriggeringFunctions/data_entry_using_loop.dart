// Funtion to add complete data using loop (commentind down - open if required)

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> dataLoopAddDbEntryMemberWise() async {
  int idx = 1;
  var members = 'vahab';

  final dbcall2 = firestoreInstanceCall.collection('monthly_installments');
  var document1 = <String, dynamic>{};

  String getMonthAbbreviation(int month) {
    // Return the three-letter abbreviation for the month
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      // Add more cases for the remaining months
      // ...

      default:
        return '';
    }
  }

  String getFormattedMonth(int idx) {
    // Calculate the year and month based on the idx value
    int year = 2022 + ((idx - 1) ~/ 12); // 12 months per year
    int month = ((idx - 1) % 12) + 1; // Months are 1-based

    // Format the month and year as 'Jan 2022', 'Feb 2022', etc.
    return '${getMonthAbbreviation(month)} $year';
  }

  
    for (idx = 10; idx < 15; idx++) {
      document1 = <String, dynamic>{
        "comments": {'$idx': 'old book records'},
        "ispaid": {'$idx': false},
        "months": {'$idx': getFormattedMonth(idx)},
        "dateTime": {'$idx': Timestamp.now()}
      };

      // Now you can use document1 to update Firestore
      await dbcall2.doc(members).set(document1, SetOptions(merge: true));
    }
}
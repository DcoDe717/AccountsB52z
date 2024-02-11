// Funtion to add complete data using loop (commentind down - open if required)

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> dataLoopAddDbEntryMemberWiseOrFull() async {
  int idx = 1;
  var memberName = 'cheppu';
  List<String> membersList = [
    'adil',
    'akku',
    'cheppu',
    'dillu',
    'ismail',
    'jasim',
    'rishin',
    'sabith',
    'shammas',
    'sherbi',
    'sulfi',
    'vahab'
  ];

  final dbcall2 = firestoreInstanceCall.collection('loan_installment');
  var document1 = <String, dynamic>{};

  // String getMonthAbbreviation(int month) {
  //   // Return the three-letter abbreviation for the month
  //   switch (month) {
  //     case 1:
  //       return 'Apr';
  //     case 2:
  //       return 'May';
  //     case 3:
  //       return 'June';
  //     case 4:
  //       return 'July';
  //     case 5:
  //       return 'Aug';
  //     case 6:
  //       return 'Sept';
  //     case 7:
  //       return 'Oct';
  //     case 8:
  //       return 'Nov';
  //     case 9:
  //       return 'Dec';
  //     case 10:
  //       return 'Jan';
  //     case 11:
  //       return 'Feb';
  //     case 12:
  //       return 'Mar';
  //     // Add more cases for the remaining months
  //     // ...

  //     default:
  //       return '';
  //   }
  // }

  // String getFormattedMonth(int idx) {
  //   // Added 3 since starting month is April 2020
  //   int idxExtra = idx + 3;
  //   // Calculate the year and month based on the idx value
  //   int year = 2020 + ((idxExtra - 1) ~/ 12); // 12 months per year
  //   int month = ((idx - 1) % 12) + 1; // Months are 1-based

  //   // Format the month and year as 'Jan 2022', 'Feb 2022', etc.
  //   return '${getMonthAbbreviation(month)} $year';
  // }
 

  for (var i = 1; i < 12; i++) {
    for (idx = 1; idx < 48; idx++) {
      document1 = <String, dynamic>{
        "comment_monthly": {'$idx': 'old book records'},
        "ispaid_monthly": {'$idx': true},
        "dateTime_monthly": {'$idx': Timestamp.now()},
        // "months": {'$idx': getFormattedMonth(idx)},
      };

      // Now you can use document1 to update Firestore
      await dbcall2.doc(membersList[i]).set(document1, SetOptions(merge: true));
    }
    await dbcall2.doc(membersList[i]).set(document1, SetOptions(merge: true));
  }
}

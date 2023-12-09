// Funtion to add complete data using loop (commentind down - open if required)

// Future<void> newFunc01() async {
//   int idx = 1;
//   var members = 'try1';

//   final dbcall2 = firestoreInstanceCall.collection('monthly_installments');
//   var document1 = <String, dynamic>{
//     // "comments": {'$idx': 'old book records'},
//     // "ispaid": {'$idx': true},
//     // "month": {'$idx': 'Jan 2022'},
//     // "date": {'$idx': Timestamp.now()}
//   };

//   // final document2 = <String, dynamic>{
//   //   "comments.$idx": 'paid=3000 | added=jasim | comment=phonpe23',
//   //   "ispaid.$idx": false,
//   //   "month.$idx": 'nov2023',
//   //   "date.$idx": Timestamp.now()
//   // };

//   // for (var i = 1; i < 2; i++) {
//   //   for (idx = 1; idx < 16; idx++) {

//   //    document1 = <String, dynamic>{
//   //   "comments": {'$idx': 'old book records'},
//   //   "ispaid": {'$idx': true},
//   //   "month": {'$idx': 'Jan 2022'},
//   //   "date": {'$idx': Timestamp.now()}
//   // };

//   //     await dbcall2.doc(members).set(document1, SetOptions(merge: true));

//   //   }
//   // }

//   //----------------------------------------------------------------------

//   String getMonthAbbreviation(int month) {
//     // Return the three-letter abbreviation for the month
//     switch (month) {
//       case 1:
//         return 'Jan';
//       case 2:
//         return 'Feb';
//       case 3:
//         return 'Mar';
//       case 4:
//         return 'Apr';
//       case 5:
//         return 'May';
//       case 6:
//         return 'June';
//       case 7:
//         return 'July';
//       case 8:
//         return 'Aug';
//       case 9:
//         return 'Sep';
//       case 10:
//         return 'Oct';
//       case 11:
//         return 'Nov';
//       case 12:
//         return 'Dec';
//       // Add more cases for the remaining months
//       // ...

//       default:
//         return '';
//     }
//   }

//   String getFormattedMonth(int idx) {
//     // Calculate the year and month based on the idx value
//     int year = 2022 + ((idx - 1) ~/ 12); // 12 months per year
//     int month = ((idx - 1) % 12) + 1; // Months are 1-based

//     // Format the month and year as 'Jan 2022', 'Feb 2022', etc.
//     return '${getMonthAbbreviation(month)} $year';
//   }

//   for (var i = 1; i < 2; i++) {
//     for (idx = 1; idx < 4; idx++) {
//       document1 = <String, dynamic>{
//         "comments": {'$idx': 'old book records'},
//         "ispaid": {'$idx': true},
//         "month": {'$idx': getFormattedMonth(idx)},
//         "date": {'$idx': Timestamp.now()}
//       };

//       // Now you can use document1 to update Firestore
//       await dbcall2.doc('$members').set(document1, SetOptions(merge: true));
//     }
//   }

//   //----------------------------------------------------------------------

// // await dbcall2.doc('$members').set(document1, SetOptions(merge: true));
//   // await dbcall2.doc('akku').set(document1, SetOptions(merge: true));
//   // await dbcall2.doc('akku').update(document1);
// }

// Funtion to update (ispaid = false) pending months and count in each member document
// Future<void> updatePendingMonthsAndCount23() async {
//   final db = firestoreInstanceCall;
//   final monthlyInstallmentsCollection = db.collection('monthly_installments');

//   // Fetch all documents from the "monthly_installments" collection
//   QuerySnapshot monthlyInstallments = await monthlyInstallmentsCollection.get();

//   for (var doc in monthlyInstallments.docs) {
//     // Explicitly cast doc.data() to Map<String, dynamic>
//     final dataMap = doc.data() as Map<String, dynamic>;

//     // Check if 'ispaid' field exists and is a map
//     if (dataMap.containsKey('ispaid') &&
//         dataMap['ispaid'] is Map<dynamic, dynamic>) {
//       // If 'ispaid' is a map, cast it to Map<dynamic, dynamic>
//       final ispaidMap = dataMap['ispaid'] as Map<dynamic, dynamic>;

//       // Iterate through the map and check the boolean values
//       List<String> pendingMonths = [];
//       ispaidMap.forEach((key, value) {
//         if (value is bool && !value) {
//           pendingMonths.add(key.toString());
//         }
//       });

//       // Convert the list of index numbers to a comma-separated string
//       String pendingMonthsString = pendingMonths.join(',');

//       // Create or update the 'pending_months' field in the document
//       await monthlyInstallmentsCollection.doc(doc.id).set(
//           {'pending_months': pendingMonthsString}, SetOptions(merge: true));

//       // Create or update the 'pending_months_count' field with the count of pending months
//       await monthlyInstallmentsCollection.doc(doc.id).set(
//           {'pending_months_count': pendingMonths.length},
//           SetOptions(merge: true));
//     }
//   }
// }
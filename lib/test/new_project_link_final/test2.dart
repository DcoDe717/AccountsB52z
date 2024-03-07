// // ignore_for_file: avoid_print
// import 'dart:developer';
// import 'package:accountsb52z/screens/global/global_variables.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// int monthsPassedSince(DateTime fromDate) {
//   DateTime currentDate = DateTime.now();

//   int months = (currentDate.year - fromDate.year) * 12 +
//       currentDate.month -
//       fromDate.month;
//   months++;

//   return months;
// }

// Future<void> updateNewMonthInDB() async {
//   List<String> membersList = [
//     'adil',
//     'akku',
//     'cheppu',
//     'dillu',
//     'ismail',
//     'jasim',
//     'rishin',
//     'sabith',
//     'shammas',
//     'sherbi',
//     'sulfi',
//     'vahab'
//   ];

//   var document1 = <String, dynamic>{};

//   final dbcall2 = firestoreInstanceCall.collection('monthly_installment');

//   try {
//     // Get the current latest DB month index
//     final docRef =
//         firestoreInstanceCall.collection('monthly_installment').doc('dillu');

//     // Fetch the document data
//     final DocumentSnapshot docSnapshot = await docRef.get();

//     if (docSnapshot.exists) {
//       Map<String, dynamic>? isPaidMonthly =
//           (docSnapshot.data() as Map<String, dynamic>?)?['ispaid_monthly'];

//       List<String> keys = isPaidMonthly!.keys.toList();

//       // Convert strings to integers
//       List<int> intKeysMonths = keys.map((str) => int.parse(str)).toList();

//       // Sort the list of integers
//       intKeysMonths.sort();

//       // Get the last month index from the list
//       int lastMonthIndex = intKeysMonths.last;

//       // Get Current month index
//       int currentMonthIndex = monthsPassedSince(DateTime(2020, 4));

//       if (lastMonthIndex < currentMonthIndex) {
//         // Updating the month in the DB
//         for (var i = 0; i < 12; i++) {
//           for (var idx = lastMonthIndex + 1; idx <= currentMonthIndex; idx++) {
//             document1 = <String, dynamic>{
//               "ispaid_monthly": {'$idx': false},
//             };

//             // Now you can use document1 to update Firestore
//             await dbcall2
//                 .doc(membersList[i])
//                 .set(document1, SetOptions(merge: true));
//           }
//         }
//       }
//     } else {
//       log('Document does not exist');
//     }
//   } catch (e) {
//     log('Error retrieving document: $e');
//   }
// }

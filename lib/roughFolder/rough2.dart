// // ignore_for_file: avoid_print

// import 'package:accounts3/screens/global/global_variables.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MultiSelectScreen extends StatelessWidget {
//   const MultiSelectScreen({Key? key}) : super(key: key);

//   // Your other widget code...


//     Future<DocumentSnapshot> getMonthlyInstallments() async {
//     try {
//       return await firestoreInstanceCall
//           .collection('monthly_emi_log')
//           .doc(gSelectedMember)
//           .get();
//     } catch (e) {
//       // Handle errors appropriately (e.g., log, show error message)
//       print('Error fetching monthly installments: $e');
//       rethrow;
//     }
//   }

//   Future<DocumentSnapshot> getLoanStatus() async {
//     try {
//       return await firestoreInstanceCall
//           .collection('loan_status')
//           .doc(gSelectedMember)
//           .get();
//     } catch (e) {
//       print('Error fetching loan status: $e');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<DocumentSnapshot>>(
//       future: Future.wait([
//         getMonthlyInstallments(),
//         getLoanStatus(),
//       ]),
//       builder: (context, snapshots) {
//         if (snapshots.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshots.hasError) {
//           return const Center(child: Text('Error fetching data'));
//         }

//         final monthlyInstallmentsSnapshot = snapshots.data![0];
//         final loanStatusSnapshot = snapshots.data![1];

//         if (!monthlyInstallmentsSnapshot.exists) {
//           return const Center(child: Text('Monthly installments document does not exist'));
//         }

//         if (!loanStatusSnapshot.exists) {
//           return const Center(child: Text('Loan status document does not exist'));
//         }

//         final isLoanActive = loanStatusSnapshot['is_active'];

//         if (isLoanActive != true) {
//           // The loan is not active, you can handle this case accordingly
//           return const Center(child: Text('Loan is not active'));
//         }

//         // pendingMonthlyMonthsFromDbRaw = monthlyInstallmentsSnapshot['months_paid'];

//         return const Scaffold(
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [Text('hola')],
//           ),
//         );
//       },
//     );
//   }
// }

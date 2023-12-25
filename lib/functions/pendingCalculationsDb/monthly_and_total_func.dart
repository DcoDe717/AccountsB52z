// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> totPendingCountMemberWiseList(List<String> members) async {
  pendingCountListMemberWiseMonthly = [];

  for (String nameMember in members) {
    final DocumentReference docTotal = firestoreInstanceCall
        .collection('monthly_installments')
        .doc(nameMember);

    DocumentSnapshot docTotalSnapshot = await docTotal.get();
    if (docTotalSnapshot.exists) {
      int nameMemberPendingStore = docTotalSnapshot['pending_months_count'];
      pendingCountListMemberWiseMonthly.add(nameMemberPendingStore);

      // print('pendingCounts.add(nameMemberPendingStore): $pendingCounts');
    } else {
      // Handle the case when the document doesn't exist for a member
      pendingCountListMemberWiseMonthly.add(0);
      print('pendingCounts.add(0); $pendingCountListMemberWiseMonthly');
      // You can use any default value
    }
  }

  print('pendingCounts: $pendingCountListMemberWiseMonthly');

  totalValueAllMembersPendingAmountCalcFromListMemberWise = 0;

  print(
      'totalValueAllMembersPendingAmountCalcFromListMemberWise before : $totalValueAllMembersPendingAmountCalcFromListMemberWise');

  totalValueAllMembersPendingAmountCalcFromListMemberWise =
      (pendingCountListMemberWiseMonthly.reduce((value, element) => value + element)) * 500;

  print(
      "totalValueAllMembersPendingAmountCalcFromListMemberWise after: $totalValueAllMembersPendingAmountCalcFromListMemberWise");

  return 0;
}




// Future<int> totPendingCountMemberWise(String nameMember) async {
//   int nameMemberPendingStore = 0;

//   final dbcall = firestoreInstanceCall;

//   final DocumentReference docTotal =
//       dbcall.collection('monthly_installments').doc('nameMember');

//   DocumentSnapshot docTotalSnapshot = await docTotal.get();
//   nameMemberPendingStore = docTotalSnapshot['pending_months_count'];
//   // nameMemberPendingStore = totaltruecountholder * 500;

//   // print('totalTrueCount: $totaltruecountholder');
//   // print('Balance Fund: ${totaltruecountholder * 500}');
//   return 0;
// }

// Future<int> totPendingCountMemberWise(String nameMember) async {
//   int nameMemberPendingStore = 0;

//   final dbcall = firestoreInstanceCall;

//   final DocumentReference docTotal =
//       dbcall.collection('monthly_installments').doc('nameMember');

//   DocumentSnapshot docTotalSnapshot = await docTotal.get();
//   nameMemberPendingStore = docTotalSnapshot['pending_months_count'];
//   return 0;
// }
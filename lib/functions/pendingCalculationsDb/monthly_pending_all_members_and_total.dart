// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> totPendingCountMemberWiseListMonthly() async {
  final List<String> membersListLocal = <String>[
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
  pendingCountListMemberWiseMonthly = [];

  try {
    for (String nameMember in membersListLocal) {
      final DocumentReference docTotal = firestoreInstanceCall
          .collection('monthly_installment')
          .doc(nameMember);

      DocumentSnapshot docTotalSnapshot = await docTotal.get();
      if (docTotalSnapshot.exists) {
        try {
          int nameMemberPendingStore =
              docTotalSnapshot['pending_months_count_monthly'];
          pendingCountListMemberWiseMonthly.add(nameMemberPendingStore);
        } catch (e) {
          print(
              "Error accessing 'pending_months_count_monthly' field for member '$nameMember': $e");
        }

        // print('pendingCounts.add(nameMemberPendingStore): $pendingCounts');
      } else {
        // Handle the case when the document doesn't exist for a member
        pendingCountListMemberWiseMonthly.add(0);
        print('pendingCounts.add(0); $pendingCountListMemberWiseMonthly');
        // You can use any default value
      }
    }

    print('pendingCounts: $pendingCountListMemberWiseMonthly');

    totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise = 0;

    print(
        'totalValueAllMembersPendingAmountCalcFromListMemberWise before : $totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise');

    totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise =
        (pendingCountListMemberWiseMonthly
                .reduce((value, element) => value + element)) *
            500;

    print(
        "totalValueAllMembersPendingAmountCalcFromListMemberWise after: $totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise");
  } catch (e) {
    print("Error Catched (totPendingCountMemberWiseListMonthly) : $e");
  }

  return 0;
}

// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> totPendingCountMemberWiseListMonthlyUpdate(
    List<String> members) async {
  List<int> monthyPendingCountListMemberWiseDbUpdateVariable = [];

  try {
    for (String nameMember in members) {
      final DocumentReference docTotal = firestoreInstanceCall
          .collection('monthly_installment')
          .doc(nameMember);

      DocumentSnapshot docTotalSnapshot = await docTotal.get();
      if (docTotalSnapshot.exists) {
        try {
          int nameMemberPendingStore =
              docTotalSnapshot['pending_months_count_monthly'];
          monthyPendingCountListMemberWiseDbUpdateVariable
              .add(nameMemberPendingStore);
        } catch (e) {
          print(
              "Error accessing 'pending_months_count_monthly' field for member '$nameMember': $e");
        }

        // print('pendingCounts.add(nameMemberPendingStore): $pendingCounts');
      } else {
        // Handle the case when the document doesn't exist for a member
        monthyPendingCountListMemberWiseDbUpdateVariable.add(0);
        print(
            'pendingCounts.add(0); $monthyPendingCountListMemberWiseDbUpdateVariable');
        // You can use any default value
      }
    }

    print('pendingCounts: $monthyPendingCountListMemberWiseDbUpdateVariable');

    totalMonthlyPendingAmountCalcFromMemberWiseCountList = 0;

    print(
        'totalValueAllMembersPendingAmountCalcFromListMemberWise before : $totalMonthlyPendingAmountCalcFromMemberWiseCountList');

    final docRef =
        firestoreInstanceCall.collection('dashboard').doc('gross_total_docs');

    await docRef.set({
      'monthly_pending_count_list_all_members':
          monthyPendingCountListMemberWiseDbUpdateVariable
    }, SetOptions(merge: true));



    print(
        "totalValueAllMembersPendingAmountCalcFromListMemberWise after: $totalMonthlyPendingAmountCalcFromMemberWiseCountList");
  } catch (e) {
    print("Error Catched (totPendingCountMemberWiseListMonthly) : $e");
  }

  return 0;
}

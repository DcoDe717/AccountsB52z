// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> totPendingCountMemberWiseListLoan(List<String> members) async {
  pendingLoanAmountAllMembersPulledDB = [];

  for (String nameMember in members) {
    final DocumentReference docTotal =
        firestoreInstanceCall.collection('loan_installment').doc(nameMember);

    DocumentSnapshot docTotalSnapshot = await docTotal.get();

    // Check if the field 'loan_amount_pending_to_pay' exists in the document
    Map<String, dynamic>? docCollectionMapped =
        docTotalSnapshot.data() as Map<String, dynamic>?;

    if (docCollectionMapped != null &&
        docCollectionMapped.containsKey('loan_amount_pending_to_pay')) {
      double storePendingLoanAmountMemberWise =
          (docTotalSnapshot['loan_amount_pending_to_pay']).toDouble();
      print(
          'loan amount pending to pay for $nameMember is ₹ $storePendingLoanAmountMemberWise');
      pendingLoanAmountAllMembersPulledDB.add(storePendingLoanAmountMemberWise);

      // print('pendingCounts.add(nameMemberPendingStore): $pendingCounts');
    } else {
      // Handle the case when the document doesn't exist for a member
      pendingLoanAmountAllMembersPulledDB.add(0);
      print('user does not have loan_amount_pending_to_pay field');
      // You can use any default value
    }
  }

  print('pendingCounts: $pendingLoanAmountAllMembersPulledDB');

  return 0;
}

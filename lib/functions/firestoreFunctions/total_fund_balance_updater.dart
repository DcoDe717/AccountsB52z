// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> calculateTotalBalanceFundWhole() async {
  try {
    double totalBalanceFund = 0;
    double monthlyTotalFund = 0;

    final docSnapMonthly = await firestoreInstanceCall
        .collection('dashboard')
        .doc('total_doc_values_monthly')
        .get();

    final docSnapLoan = await firestoreInstanceCall
        .collection('dashboard')
        .doc('total_doc_values_loan')
        .get();

    if (docSnapMonthly.exists) {
      monthlyTotalFund =
          (docSnapMonthly['total_fund_recieved_from_true_count_monthly'] ?? 0)
              .toDouble();
    }

    if (docSnapLoan.exists) {
      loanTotalPendingFundPulledDB =
          (docSnapLoan['total_loan_pending_all_members'] ?? 0).toDouble();
    }

    totalBalanceFund = monthlyTotalFund - loanTotalPendingFundPulledDB;

    final docRefLoan = firestoreInstanceCall
        .collection('dashboard')
        .doc('gross_total_docs');

    await docRefLoan.set({
      'total_balance_fund_whole': totalBalanceFund,
    }, SetOptions(merge: true));

    // print('total_balance_fund_whole : $totalBalanceFund');
  } catch (e, stackTrace) {
    print('Error: $e\n$stackTrace');
    // Handle the error as needed
  }
}

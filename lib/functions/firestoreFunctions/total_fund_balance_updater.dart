// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> calculateTotalBalanceFundWhole() async {   
  try {
    double totalBalanceFund = 0;
    double monthlyTotalFund = 0;
    double loanTotalFund = 0;

    final docSnapMonthly = await firestoreInstanceCall
        .collection('monthly_installments')
        .doc('total_doc_values')
        .get();

    final docSnapLoan = await firestoreInstanceCall
        .collection('loan_installments')
        .doc('total_doc_values_loan')
        .get();

    if (docSnapMonthly.exists) {
      monthlyTotalFund = docSnapMonthly['balance_fund_from_true_count_monthly'] ?? 0;
    }

    if (docSnapLoan.exists) {
      loanTotalFund = docSnapLoan['total_loan_pending_all_members'] ?? 0;
    }

    totalBalanceFund = monthlyTotalFund - loanTotalFund;

    final docRefLoan = firestoreInstanceCall
        .collection('loan_installments')
        .doc('total_doc_values_loan');

    await docRefLoan.set({
      'total_balance_fund_whole': totalBalanceFund,
    },SetOptions(merge: true));

    print('total_balance_fund_whole : $totalBalanceFund');
  } catch (e, stackTrace) {
    print('Error: $e\n$stackTrace');
    // Handle the error as needed
  }
}

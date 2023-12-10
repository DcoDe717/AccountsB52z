import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> balanceFund() async {
  // int totaltruecountholder = 0;

  final DocumentReference docTotal = firestoreInstanceCall
      .collection('loan_installments')
      .doc('total_doc_values_loan');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();

  balanceFundTotal = docTotalSnapshot['total_balance_fund_whole'];

  // balanceFundTotal = totaltruecountholder * 500;
}

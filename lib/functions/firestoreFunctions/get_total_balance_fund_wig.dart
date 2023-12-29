import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getTotalBalanceFundDb() async {
  // int totaltruecountholder = 0;

  final DocumentReference docTotal = firestoreInstanceCall
      .collection('loan_installments')
      .doc('total_doc_values_loan');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();

  balanceFundTotalPulledFromDB = docTotalSnapshot['total_balance_fund_whole'];
}

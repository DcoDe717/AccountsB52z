import 'package:accounts3/screens/global/global_files.dart';
import 'package:accounts3/screens/home/common_files_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> balanceFund() async {
  // int totaltruecountholder = 0;

  final DocumentReference docTotal = firestoreInstanceCall
      .collection('monthly_installments')
      .doc('total_doc_values');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();

  balanceFundTotal = docTotalSnapshot['balance_fund_from_true_count'];

  // balanceFundTotal = totaltruecountholder * 500;
}

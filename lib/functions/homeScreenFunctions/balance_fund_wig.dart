import 'package:accounts3/screens/global/global_files.dart';
import 'package:accounts3/screens/home/common_files_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> balanceFund() async {
  int totaltruecountholder = 0;

 

  final DocumentReference docTotal =
      firestoreInstanceCall.collection('monthly_installments').doc('total_doc_values');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();
  totaltruecountholder = docTotalSnapshot['totalTrueCount'];
  balanceFundPieChart = totaltruecountholder * 500;

  // print('totalTrueCount: $totaltruecountholder');
  // print('Balance Fund: ${totaltruecountholder * 500}');
  return 0;
}

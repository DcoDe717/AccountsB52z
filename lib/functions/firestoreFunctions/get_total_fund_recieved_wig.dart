import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getTotalFundRecievedFromDb() async {
  // int totaltruecountholder = 0;

  final DocumentReference docTotal = firestoreInstanceCall
      .collection('monthly_installments')
      .doc('total_doc_values');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();

  totalFundRecievedPulledFromDB =
      docTotalSnapshot['balance_fund_from_true_count_monthly'];

  // total expected fund calculated here since this function is executing last in initialization
  totalFundExpectedCalculatedLocal = balanceFundTotalPulledFromDB +
      totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;
}

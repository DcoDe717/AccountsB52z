import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/home/homepages/02_total_pending_view/utils/switchcase_value_retrievel.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getTotalFundRecievedFromDb() async {
  // int totaltruecountholder = 0;

  final DocumentReference docTotal = firestoreInstanceCall
      .collection('monthly_installment')
      .doc('total_doc_values_monthly');

  DocumentSnapshot docTotalSnapshot = await docTotal.get();

  totalFundRecievedPulledFromDB =
      (docTotalSnapshot['balance_fund_from_true_count_monthly']).toDouble();

  // total expected fund calculated here since this function is executing last in initialization
  totalFundExpectedCalculatedLocal = balanceFundTotalPulledFromDB +
      totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;

      switchcaseNameToValueRetrievelFuction(userNameGlobal);
}

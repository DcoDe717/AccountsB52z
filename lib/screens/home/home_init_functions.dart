import 'package:accounts3/functions/firestoreFunctions/get_total_balance_fund_wig.dart';
import 'package:accounts3/functions/firestoreFunctions/get_total_fund_recieved_wig.dart';
import 'package:accounts3/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accounts3/functions/pendingCalculationsDb/loan_pending_all_members_and_total.dart';
import 'package:accounts3/functions/pendingCalculationsDb/monthly_pending_all_members_and_total.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';

Future<void> homeScreenInitFunctionsOrdered() async {
  // Call your initialization functions here
  await totPendingCountMemberWiseListMonthly(membersListLocal);
  await calculateTotalBalanceFundWhole();
  await totPendingCountMemberWiseListLoan(membersListLocal);
  await getTotalBalanceFundDb();
  await getTotalFundRecievedFromDb();
}

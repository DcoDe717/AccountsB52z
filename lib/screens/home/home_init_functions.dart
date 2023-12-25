import 'package:accounts3/functions/firestoreFunctions/get_total_balance_fund_wig.dart';
import 'package:accounts3/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accounts3/functions/pendingCalculationsDb/monthly_and_total_func.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';

Future<void> homeScreenInitFunctionsOrdered() async {
  // Call your initialization functions here
  await totPendingCountMemberWiseList(membersListLocal);
  await calculateTotalBalanceFundWhole();
  await getTotalBalanceFundDb();
}

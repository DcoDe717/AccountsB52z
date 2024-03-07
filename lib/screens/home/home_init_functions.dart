// ignore_for_file: avoid_print

import 'package:accountsb52z/functions/firestoreFunctions/read_dashboard_data.dart';
import 'package:accountsb52z/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accountsb52z/functions/firestoreFunctions/updating_new_months.dart';
import 'package:accountsb52z/functions/pendingCalculationsDb/loan_pending_all_members_and_total.dart';
import 'package:accountsb52z/functions/pendingCalculationsDb/monthly_pending_all_members_and_total.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';

Future<void> homeScreenInitFunctionsOrdered() async {
  try {
    // Call your initialization functions here
    if (isAdminFunctionExecuted) {
      await totPendingCountMemberWiseListMonthlyUpdate(membersListLocal);
      await calculateTotalBalanceFundWhole();
      await totPendingCountMemberWiseListLoan(membersListLocal);
      await readAllDbDashboardData();
      isAdminFunctionExecuted = false;
      updateNewMonthInDB();
    } else {
      // Normal Splash screen function only reading data for better login speed.
      await readAllDbDashboardData();
      updateNewMonthInDB();
    }
  } catch (e) {
    print("Error Catched (homeScreenInitFunctionsOrdered): $e");
  }
}

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';

void switchcaseNameToValueRetrievelFuction(String userName) {
  switchCaseRetrievedValueMonthly = 0;
  switchCaseRetrievedValueLoan = 0;

  switch (userName) {
    case 'Total':
      switchCaseRetrievedValueMonthly =
          totalMonthlyPendingAmountCalcFromMemberWiseCountList;
      switchCaseRetrievedValueLoan = loanTotalPendingFundPulledDB;
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'adil':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[0] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[0];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'akku':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[1] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[1];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'cheppu':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[2] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[2];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'dillu':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[3] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[3];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'ismail':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[4] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[4];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'jasim':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[5] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[5];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'rishin':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[6] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[6];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sabith':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[7] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[7];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'shammas':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[8] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[8];

      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sherbi':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[9] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[9];

      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sulfi':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[10] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[10];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'vahab':
      switchCaseRetrievedValueMonthly =
          monthyPendingCountListMemberWise[11] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[11];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;

      break;
  }

  // print('userName inside retrievel function : $userName');
  // print(
  //     'switchCaseRetrievedValueMonthly inside retrievel function : $switchCaseRetrievedValueMonthly');
  // print(
  //     'switchCaseRetrievedValueLoan inside retrievel function : $switchCaseRetrievedValueLoan');
}

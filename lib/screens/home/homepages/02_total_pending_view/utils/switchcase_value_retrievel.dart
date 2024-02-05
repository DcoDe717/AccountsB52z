import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/home/homepages/common_variables_homepage.dart';

void switchcaseNameToValueRetrievelFuction(String userName) {
  switchCaseRetrievedValueMonthly = 0;
  switchCaseRetrievedValueLoan = 0;

  switch (userName) {
    case 'Total':
      switchCaseRetrievedValueMonthly =
          totalMonthlyPendingValueAllMembersPendingAmountCalcFromListMemberWise;
      switchCaseRetrievedValueLoan = loanTotalPendingFundPulledDB;
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'adil':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[0] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[0];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'akku':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[1] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[1];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'cheppu':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[2] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[2];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'dillu':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[3] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[3];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'ismail':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[4] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[4];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'jasim':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[5] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[5];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'rishin':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[6] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[6];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sabith':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[7] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[7];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'shammas':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[8] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[8];

      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sherbi':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[9] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[9];

      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'sulfi':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[10] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[10];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;
      break;

    case 'vahab':
      switchCaseRetrievedValueMonthly =
          pendingCountListMemberWiseMonthly[11] * 500;
      switchCaseRetrievedValueLoan = pendingLoanAmountAllMembersPulledDB[11];
      totalSwitchCaseMonthlyPlusLoan =
          switchCaseRetrievedValueMonthly + switchCaseRetrievedValueLoan;

      break;
  }

  print('userName inside retrievel function : $userName');
  print(
      'switchCaseRetrievedValueMonthly inside retrievel function : $switchCaseRetrievedValueMonthly');
  print(
      'switchCaseRetrievedValueLoan inside retrievel function : $switchCaseRetrievedValueLoan');
}

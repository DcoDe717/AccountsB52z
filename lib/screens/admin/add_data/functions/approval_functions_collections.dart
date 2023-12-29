// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/add_data/functions/index_extractor_from_selected_months.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:accountsb52z/screens/global/utils/common_converters.dart';

Future<void> onPressedFunctionsCallForMonthly() async {


  // Calling funtion to create index number list from selected months list
  numericValuesListMonthlyInst =
      reverseMonthNameList(gSelectedMonthsMonthlyInstallmentsMultiSelect);

  // printing demo
  print(
      "gSelectedMonthsMonthlyInstallmentsMultiSelect :  $gSelectedMonthsMonthlyInstallmentsMultiSelect");

  print("numericValuesListMonthlyInst : $numericValuesListMonthlyInst");

  // // Function to create list of string from list of int
  numericListStringConverter(numericValuesListMonthlyInst);

  print("numericValuesListString : $numericValuesListMonthlyInstString");
}

Future<void> onPressedFunctionsCallForLoan() async {
  extractedIndexValueFromSelectedLoanMonths =
      extractNumbersAsString(gSelectedMonthsLoanInstallmentsMultiSelect);

  print(
      'extractedIndexValueFromSelectedLoanMonths  :  $extractedIndexValueFromSelectedLoanMonths');
}

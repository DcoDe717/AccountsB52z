// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/add_data/functions/index_extractor_from_selected_months.dart';
import 'package:accounts3/screens/admin/common_variables_admin.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/global/utils/common_converters.dart';

Future<void> onPressedFunctionsCallForMonthly() async {
  // Calling amount modifier update function
  updateAmountModifier();

  // Calling Funtion to modify the amount in the Add New Entry Screen
  updateSelectedDropdownValue();

  // Calling funtion to create index number list from selected months list
  numericValuesListMonthlyInst =
      reverseMonthNameList(gSelectedMonthsMonthlyInstallmentsMultiSelect);

  // printing demo
  print(
      "gSelectedMonthsMonthlyInstallmentsMultiSelect :  $gSelectedMonthsMonthlyInstallmentsMultiSelect");

  print("numericValuesList : $numericValuesListMonthlyInst");

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

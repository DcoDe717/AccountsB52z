// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/common_variables_admin.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/global/utils/common_converters.dart';

Future<void> onPressedFunctionsCallForMonthly() async {
  // Calling amount modifier update function
  updateAmountModifier();

  // Calling Funtion to modify the amount in the Add New Entry Screen
  updateSelectedDropdownValue();

  // Calling funtion to create index number list from selected months list
  numericValuesList =
      reverseMonthNameList(gSelectedMonthsMonthlyInstallmentsMultiSelect);

  // printing demo
  print(
      "gSelectedMonthsMonthlyInstallmentsMultiSelect :  $gSelectedMonthsMonthlyInstallmentsMultiSelect");

  print("numericValuesList : $numericValuesList");

  // // Function to create list of string from list of int
  numericListStringConverter(numericValuesList);

  print("numericValuesListString : $numericValuesListString");
}

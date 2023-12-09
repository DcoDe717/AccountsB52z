
import 'package:accounts3/screens/global/global_variables.dart';

List<String> numericListStringConverter(List<int> numericListPara) {
  numericValuesListString =
      numericValuesList.map((value) => value.toString()).toList();

  return numericValuesListString;
}

// Funtion to modify the amount in the Add New Entry Screen
void updateSelectedDropdownValue() {
  selectedDropdownValue = gSelectedMember;
}


// Call the function to calculate the new amountModifier value
void updateAmountModifier() {
  amountModifier =
      calculateAmountModifier(gSelectedMonthsMonthlyInstallmentsMultiSelect);
}


// Funtion that takes array string and return the value count strings multiplied by 500
int calculateAmountModifier(List<dynamic> selectedMonths) {
  return selectedMonths.length * 500;
}



// Function to reverse create the list from months selected to the universal index string list to update the database

List<int> reverseMonthNameList(List<dynamic> monthNamesList) {
  // Create a mapping of month names to their corresponding numeric values
  final Map<String, int> monthNameToValue = {
    'Jan': 1,
    'Feb': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'Aug': 8,
    'Sept': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };

  // Extract numeric values from the month names
  numericValuesList = [];
  int totalMonths = 0;
  int currentYear = 2022;

  for (String monthName in monthNamesList) {
    final match = RegExp(r'(\w+) (\d{4})$').firstMatch(monthName);
    int monthValue = monthNameToValue[match?.group(1)] ?? 0;
    int extractedYear = int.parse(match?.group(2) ?? '0');

    // Calculate the total months for each year
    totalMonths += (extractedYear - currentYear) * 12;

    // Update the current year
    currentYear = extractedYear;

    // Calculate the final numeric value
    int numericValue = totalMonths + monthValue;
    numericValuesList.add(numericValue);
  }

  return numericValuesList;
}
import 'package:accounts3/screens/admin/add_data/functions/approval_functions_collections.dart';
import 'package:accounts3/screens/global/utils/common_converters.dart';

Future<void> onpressedSelectEntryFieldSubmitCollection() async {
  await onPressedFunctionsCallForMonthly();

  await onPressedFunctionsCallForLoan();

  // Calling amount modifier update function
  await updateAmountModifier();

  // Calling Funtion to modify the amount in the Add New Entry Screen
  await updateSelectedDropdownValue();
}

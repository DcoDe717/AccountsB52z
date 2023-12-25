// Function to clear the fields after loan approval screen is close
import 'package:accounts3/screens/admin/admin_common_files.dart';

void stateClear() {
  selectedDropdownValueAdmin = null;
  loanAmountTextControllerLoanApproveScreen.clear();
  commentsTextControllerLoanApproveScreen.clear();
}
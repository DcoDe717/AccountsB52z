// Function to clear the fields after loan approval screen is close
import 'package:accountsb52z/screens/admin/admin_common_files.dart';

void stateClearLoanApprovalScreen() {
  selectedDropdownValueAdmin = null;
  loanAmountTextControllerLoanApproveScreen.clear();
  commentsTextControllerLoanApproveScreen.clear();
}

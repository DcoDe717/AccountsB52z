import 'package:accountsb52z/functions/firestoreFunctions/all_pending_months_false_check_for_is_active_update.dart';
import 'package:accountsb52z/functions/firestoreFunctions/memberwise_update_pend_months_amount_loan.dart';
import 'package:accountsb52z/functions/firestoreFunctions/total_fund_balance_updater.dart';
import 'package:accountsb52z/functions/firestoreFunctions/update_pending_loan_amount_total.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../screens/global/global_variables.dart';

// Update true for the ispaid_monthly list in DB with the index value selected, and comments / Timestamp
Future<void> updateFSFieldsForLoanSelectedMonths(
    String collection,
    String document,
    String field,
    List<String> indexFinal,
    String commentsDown) async {
  final DocumentReference documentReference =
      firestoreInstanceCall.collection(collection).doc(document);

  // Create a list to store all update operations
  List<Future<void>> updateOperations = [];

  // Loop through indexFinal list and update Firestore fields
  for (String index in indexFinal) {
    int? parsedIndex = int.tryParse(index);
    if (parsedIndex != null) {
      // Use update method to update specific field and store the future in the list
      Future<void> updateOperation = documentReference.update({
        '$field.$parsedIndex': true,
        'comments_emi.$parsedIndex': 'Added by $userNameGlobal | $commentsDown',
        'dateTime_emi.$parsedIndex': Timestamp.now(),
      });
      updateOperations.add(updateOperation);
    }
  }

  // Wait for all update operations to complete
  await Future.wait(updateOperations);

  // execute next function after the await fucntion.

  await updatePendingMonthsAndAmountMemberWiseLoan(gSelectedMember);

  await calculateTotalPendingLoanAmount();

  await calculateTotalBalanceFundWhole();

  await isLoanActiveUpdater(gSelectedMember);
}

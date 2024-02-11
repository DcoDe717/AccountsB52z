// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> retrieveEmiMonthNamesLoan(List<String> keysToAccess) async {
  // Collection reference
  CollectionReference loanStatusCollection =
      firestoreInstanceCall.collection('loan_installment');

  falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect.clear();

  try {
    // Document reference
    DocumentSnapshot docSnapShotLocalFromRetrieveEmiMonthNamesFunction =
        await loanStatusCollection.doc(gSelectedMember).get();

    // Check if the document exists
    if (!docSnapShotLocalFromRetrieveEmiMonthNamesFunction.exists) {
      print("Document does not exist");
    }

    loanAmountPulledFromDb =
        docSnapShotLocalFromRetrieveEmiMonthNamesFunction['loan_amount'];

    print('loanAmountPulledFromDb : $loanAmountPulledFromDb');

    // Document data
    Map<String, dynamic>? monthsNameListRetrievedFromDB =
        docSnapShotLocalFromRetrieveEmiMonthNamesFunction.data()
            as Map<String, dynamic>?;

    // List to store the retrieved values
    falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect = [];

    // Access values based on keys in the list
    for (var key in keysToAccess) {
      // Check if the key exists in the map
      if (monthsNameListRetrievedFromDB != null &&
          monthsNameListRetrievedFromDB['months_emi'] != null &&
          monthsNameListRetrievedFromDB['months_emi'][key.toString()] != null) {
        falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect.add(
            '${monthsNameListRetrievedFromDB['months_emi'][key.toString()]} | $key');

        print(falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect);
      } else {
        // If key not found, add a default value and print debugging information
        print("Key not found: $key");
        falseMonthsListRetrievedFromFalseIndexListLoanForMultiSelect
            .add("Default Value for $key");
      }
    }
  } catch (e) {
    print("Error retrieving document: $e");
  }
}

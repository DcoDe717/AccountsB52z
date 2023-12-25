// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/common_variables_admin.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> retrieveEmiMonthNames(List<String> keysToAccess) async {
  // Collection reference
  CollectionReference loanStatusCollection =
      firestoreInstanceCall.collection('loan_installments');

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
    trueMonthsListRetrievedFromTrueIndexList = [];

    // Access values based on keys in the list
    for (var key in keysToAccess) {
      // Check if the key exists in the map
      if (monthsNameListRetrievedFromDB != null &&
          monthsNameListRetrievedFromDB['emi_months'] != null &&
          monthsNameListRetrievedFromDB['emi_months'][key.toString()] != null) {
        trueMonthsListRetrievedFromTrueIndexList.add(
  '${monthsNameListRetrievedFromDB['emi_months'][key.toString()]} | $key');

        print(trueMonthsListRetrievedFromTrueIndexList);
      } else {
        // If key not found, add a default value and print debugging information
        print("Key not found: $key");
        trueMonthsListRetrievedFromTrueIndexList.add("Default Value for $key");
      }
    }
  } catch (e) {
    print("Error retrieving document: $e");
  }
}

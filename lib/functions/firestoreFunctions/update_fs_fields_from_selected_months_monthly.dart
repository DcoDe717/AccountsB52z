import 'package:accountsb52z/functions/firestoreFunctions/calculate_and_create_total_document.dart';
import 'package:accountsb52z/functions/firestoreFunctions/memberwise_update_pend_months_counts_monthly.dart';
import 'package:accountsb52z/screens/admin/common_variables_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screens/global/global_variables.dart';

// Update true of the ispaid_monthly list in DB with the index value selected, and comments / Timestamp
// Future<void> updateFSFieldsFromSelectedMonthsMonthlyInst(
//     String collection,
//     String document,
//     String field,
//     List<String> indexFinal,
//     String commentsDown) async {
//   final DocumentReference documentReference =
//       firestoreInstanceCall.collection(collection).doc(document);

//   // Loop through indexFinal list and update Firestore fields
//   for (String index in indexFinal) {
//     int? parsedIndex = int.tryParse(index);
//     if (parsedIndex != null) {
//       // Use update method to update specific field
//       await documentReference.update({
//         '$field.$parsedIndex': true,
//         'commentsMonthly.$parsedIndex': commentsDown,
//         'dateTimeMonthly.$parsedIndex': Timestamp.now(),
//       });
//     }
//   }

//   updatePendingMonthsAndCountMemberWiseMonthly(gSelectedMember);
// }




Future<void> updateFSFieldsFromSelectedMonthsMonthlyInstTest(
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
        'commentsMonthly.$parsedIndex': 'Added by $userNameGlobal | $commentsDown',
        'dateTimeMonthly.$parsedIndex': Timestamp.now(),
      });
      updateOperations.add(updateOperation);
    }
  }

  // Wait for all update operations to complete
  await Future.wait(updateOperations);

  // Now, you can execute the next function
  await updatePendingMonthsAndCountMemberWiseMonthly(gSelectedMember);

  // Now, you can execute the additional function
  await calculateAndCreateTotalDocument();
}


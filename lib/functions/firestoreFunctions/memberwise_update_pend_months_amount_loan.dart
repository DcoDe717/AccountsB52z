// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatePendingMonthsAndAmountMemberWiseLoan(
    String documentId) async {
  // Get a reference to the specific document
  final DocumentReference loanInstallmentsDocument =
      firestoreInstanceCall.collection('loan_installment').doc(documentId);

  double singleEmiAmount = 0;

  try {
    // Fetch the specific document
    DocumentSnapshot loanDocSnapshot = await loanInstallmentsDocument.get();
    double loanamountPulledFromDbLocal = await loanDocSnapshot['loan_amount'];
    singleEmiAmount = loanamountPulledFromDbLocal / 10;

    if (loanDocSnapshot.exists) {
      // Explicitly cast snapshot.data() to Map<String, dynamic>
      final dataMap = loanDocSnapshot.data() as Map<String, dynamic>;

      // Check if 'months_status_emi' field exists and is a map
      if (dataMap.containsKey('months_status_emi') &&
          dataMap['months_status_emi'] is Map<dynamic, dynamic>) {
        // If 'months_status_emi' is a map, cast it to Map<dynamic, dynamic>
        final emiMonthsMap =
            dataMap['months_status_emi'] as Map<dynamic, dynamic>;

        // Iterate through the map and check the boolean values
        int pendingMonthsCount = 0;
        emiMonthsMap.forEach((key, value) {
          if (value is bool && value == false) {
            pendingMonthsCount++;
          }
        });

        // Create or update the 'pending_months_monthly' field in the document
        await loanInstallmentsDocument.set(
          {'loan_amount_pending_to_pay': singleEmiAmount * pendingMonthsCount},
          SetOptions(merge: true),
        );
      }
    } else {
      // Document does not exist
      // print('Document $documentId does not exist');
    }
  } catch (error) {
    // Handle errors
    // print('Error getting document $documentId: $error');
  }
}

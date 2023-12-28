// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> isLoanActiveUpdater(String documentId) async {
  int falseCounter = 0;
  // Get a reference to the specific document
  final DocumentReference loanDocRef =
      firestoreInstanceCall.collection('loan_installments').doc(documentId);

  try {
    // Fetch the specific document
    DocumentSnapshot loanDocSnapshot = await loanDocRef.get();

    if (loanDocSnapshot.exists) {
      // Explicitly cast snapshot.data() to Map<String, dynamic>
      final dataMap = loanDocSnapshot.data() as Map<String, dynamic>;

      // Check if 'ispaid' field exists and is a map
      if (dataMap.containsKey('emi_months_status') &&
          dataMap['emi_months_status'] is Map<dynamic, dynamic>) {
        // If 'ispaid' is a map, cast it to Map<dynamic, dynamic>
        final ispaidMap = dataMap['emi_months_status'] as Map<dynamic, dynamic>;

        // Iterate through the map and check the any false count values

        ispaidMap.forEach((key, value) {
          if (value is bool && !value) {
            falseCounter++;
          }
        });

        if (falseCounter < 1) {
          await loanDocRef.set(
            {'is_loan_active': false},
            SetOptions(merge: true),
          );
        }
      }
    } else {
      // Document does not exist
      print('Document $documentId does not exist');
    }
  } catch (error) {
    // Handle errors
    print('Error getting document $documentId: $error');
  }
}

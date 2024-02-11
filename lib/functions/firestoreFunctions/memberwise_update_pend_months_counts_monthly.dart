// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatePendingMonthsAndCountMemberWiseMonthly(String documentId) async {
 
   // Get a reference to the specific document
  final DocumentReference monthlyInstallmentsDocument =
      firestoreInstanceCall.collection('monthly_installment').doc(documentId);

  try {
    // Fetch the specific document
    DocumentSnapshot monthlyInstallmentsSnapshot =
        await monthlyInstallmentsDocument.get();

    if (monthlyInstallmentsSnapshot.exists) {
      // Explicitly cast snapshot.data() to Map<String, dynamic>
      final dataMap =
          monthlyInstallmentsSnapshot.data() as Map<String, dynamic>;

      // Check if 'ispaid_monthly' field exists and is a map
      if (dataMap.containsKey('ispaid_monthly') &&
          dataMap['ispaid_monthly'] is Map<dynamic, dynamic>) {
        // If 'ispaid_monthly' is a map, cast it to Map<dynamic, dynamic>
        final ispaidMap = dataMap['ispaid_monthly'] as Map<dynamic, dynamic>;

        // Iterate through the map and check the boolean values
        List<String> pendingMonths = [];
        ispaidMap.forEach((key, value) {
          if (value is bool && !value) {
            pendingMonths.add(key.toString());
          }
        });

        // Convert the list of index numbers to a comma-separated string
        String pendingMonthsString = pendingMonths.join(',');

        // Create or update the 'pending_months_monthly' field in the document
        await monthlyInstallmentsDocument.set(
          {'pending_months_monthly': pendingMonthsString},
          SetOptions(merge: true),
        );

        // Create or update the 'pending_months_count_monthly' field with the count of pending months
        await monthlyInstallmentsDocument.set(
          {'pending_months_count_monthly': pendingMonths.length},
          SetOptions(merge: true),
        );
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
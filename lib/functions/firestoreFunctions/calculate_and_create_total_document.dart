import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Funtion to update the TotalTrueCount
Future<void> calculateAndCreateTotalDocument() async {
  final dbCallCollectionDocuments =
      firestoreInstanceCall.collection('monthly_installment');

  // Fetch all documents from the "monthly_installment" collection
  QuerySnapshot monthlyInstallmentsAllDocs =
      await dbCallCollectionDocuments.get();

  // Calculate the total number of ispaid_monthly fields with value true
  int totalTrueCount = 0;

  for (var doc in monthlyInstallmentsAllDocs.docs) {
    // Explicitly cast doc.data() to Map<String, dynamic>
    // Casting to Map: doc.data() is used to get the data of the current document.
    // Since the exact type is not known, it is explicitly cast to Map<String, dynamic> using as Map<String, dynamic>.
    // This allows Dart to recognize and work with the map structure.
    final dataMap = doc.data() as Map<String, dynamic>;

    // Check if 'ispaid_monthly' field exists and is a map
    // It checks if the 'ispaid_monthly' field exists in the document's data (dataMap) and if it is of type Map<dynamic, dynamic>.
    // If these conditions are met, it proceeds to the next step.
    // Casting 'ispaid_monthly' to Map: If the 'ispaid_monthly' field is a map,
    // it is explicitly cast to Map<dynamic, dynamic> using as Map<dynamic, dynamic>.
    if (dataMap.containsKey('ispaid_monthly') &&
        dataMap['ispaid_monthly'] is Map<dynamic, dynamic>) {
      final ispaidMap = dataMap['ispaid_monthly'] as Map<dynamic, dynamic>;

      // Iterate through the map and count the true values
      ispaidMap.forEach((key, value) {
        if (value is bool && value) {
          totalTrueCount++;
        }
      });
    }
  }

  // Create a new document with the calculated total and timestamp if required
  await dbCallCollectionDocuments.doc('total_doc_values_monthly').set({
    'total_true_count_monthly': totalTrueCount,
    'balance_fund_from_true_count_monthly': (totalTrueCount * 500),
    // 'timestamp': FieldValue.serverTimestamp(),
  });
}

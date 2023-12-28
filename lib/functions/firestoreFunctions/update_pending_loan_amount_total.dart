// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> calculateTotalPendingLoanAmount() async {
  double totalEMIPending = 0;

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestoreInstanceCall.collection('loan_installments').get();

  final docRefe = firestoreInstanceCall
      .collection('loan_installments')
      .doc('total_doc_values_loan');

  List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
      querySnapshot.docs;

  for (QueryDocumentSnapshot<Map<String, dynamic>> document in documents) {
    // Ensure that the 'emi_pending' field exists in all documents to prevent runtime errors.
    if (document.data().containsKey('loan_amount_pending_to_pay')) {
      double emiPending = document['loan_amount_pending_to_pay'] ?? 0.0;
      totalEMIPending += emiPending;
    }
  }

  // Create a new document with the calculated total and timestamp if required
  await docRefe.set({'total_loan_pending_all_members': totalEMIPending},SetOptions(merge: true));


  print('totalEMIPending : $totalEMIPending');

  // return totalEMIPending;
}

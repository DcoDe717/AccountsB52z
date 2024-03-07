// ignore_for_file: avoid_print

import 'package:accountsb52z/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> calculateTotalPendingLoanAmount() async {
  double totalEMIPending = 0;

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestoreInstanceCall.collection('loan_installment').get();

  final docRefe = firestoreInstanceCall
      .collection('dashboard')
      .doc('total_doc_values_loan');

  List<QueryDocumentSnapshot<Map<String, dynamic>>> documentsLoan =
      querySnapshot.docs;

  for (QueryDocumentSnapshot<Map<String, dynamic>> document in documentsLoan) {
    // Ensure that the 'emi_pending' field exists in all documents to prevent runtime errors.
    if (document.data().containsKey('loan_amount_pending_to_pay')) {
      double emiPending =
          (document['loan_amount_pending_to_pay'] ?? 0.0).toDouble();
      totalEMIPending += emiPending;
    }
  }

  // Create a new document with the calculated total and timestamp if required
  await docRefe.set({'total_loan_pending_all_members': totalEMIPending},
      SetOptions(merge: true));

  // print('totalEMIPending : $totalEMIPending');

  // return totalEMIPending;
}

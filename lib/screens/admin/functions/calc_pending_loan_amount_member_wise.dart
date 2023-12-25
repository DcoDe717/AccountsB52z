// Funtion to calculate the pending loan amount to pay

// ignore_for_file: avoid_print

import 'package:accounts3/screens/global/global_variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> countPendingLoanAmountMemberWise(String? memberName) async {
  // Reference to the Firestore collection and document
  // CollectionReference loanStatusCollection = FirebaseFirestore.instance.collection('loan_installments');
  DocumentReference documentRef =
      firestoreInstanceCall.collection('loan_installments').doc(memberName);

  // variable to store loan amount to calculate pending loan amount payment
  double loanAmountRetrieved = 0;

  try {
    // Fetch the document
    DocumentSnapshot documentSnapshot = await documentRef.get();

    // Check if the document exists
    if (documentSnapshot.exists) {
      // Get the emi_status map

      loanAmountRetrieved = documentSnapshot['loan_amount'];
      print('loanAmountRetrieved : $loanAmountRetrieved');
      loanAmountRetrieved = loanAmountRetrieved / 10;
      print('loanAmountRetrieved after 10 division : $loanAmountRetrieved');

      Map<String, dynamic>? dataFromDocument =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (dataFromDocument != null) {
        Map<String, dynamic> emiStatusMap =
            dataFromDocument['emi_months_status'] as Map<String, dynamic>? ??
                {};
        // Now you can work with emiStatusMap

        // Count the number of false values
        int falseCount =
            emiStatusMap.values.where((value) => value == false).length;

        double totalPendingCalulatedFromFalseCount =
            loanAmountRetrieved * falseCount;

        print('Number of false values in emi_status: $falseCount');

        print(
            'totalPendingCalulatedFromFalseCount : $totalPendingCalulatedFromFalseCount');

        // update loan_amount_pending_to_pay
        await documentRef.set(
          {'loan_amount_pending_to_pay': totalPendingCalulatedFromFalseCount},
          SetOptions(merge: true),
        );
      } else {
        // Handle the case where data is null or not of the expected type
      }
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error retrieving document: $e');
  }
}

// ignore_for_file: avoid_print

import 'package:accounts3/screens/admin/admin_common_files.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> checkLoanActive(String? memberCheckLoanActive) async {
  print('checkLoanActive passed value is $memberCheckLoanActive');
  // Get the document reference
  final DocumentReference documentReferenceInsideCheckLoanActiveFunction =
      FirebaseFirestore.instance
          .collection('loan_installments')
          .doc(memberCheckLoanActive);
  try {
    // Get the document snapshot
    final DocumentSnapshot snapshot =
        await documentReferenceInsideCheckLoanActiveFunction.get();

    // Check if the document exists and 'isActive' is true
    if (snapshot.exists &&
        (snapshot.data() as Map<String, dynamic>)['isloanactive'] == true) {
      print(
          'Loan is active, cannot approve anymore loan, finish the active loan first');
    } else {
      print('Loan is not active, please avail new loan');
      loanAmountTextFromTextController =
          loanAmountTextControllerLoanApproveScreen.text.trim();

      if (loanAmountTextFromTextController.isNotEmpty) {
        //   if (int.parse(loanAmountTextFromTextController) < currentBalanceValue) {
        //     // Your logic here
        //     print('loan can be approved');
        //   } else {
        //     print('Invalid loan amount format or insufficient balance');
        //   }

        // Attempt to parse the input as an integer
        loanAmountParsed = int.tryParse(loanAmountTextFromTextController);

        if (loanAmountParsed != null) {
          // Valid integer, continue processing

          if (loanAmountParsed! < currentBalanceValue) {
            // Your logic here
            print('loan can be approved since amount is less than balance');
            commentsTextFromTextControllerLoanApproveScreen =
                commentsTextControllerLoanApproveScreen.text.trim();
            print(
                'commentsTextControllerLoanApproveScreen.text.trim() :  $commentsTextFromTextControllerLoanApproveScreen');

            // Create or update the required fields in the document for loan approval
            await documentReferenceInsideCheckLoanActiveFunction.set(
              {
                'is_loan_active': true,
                'loan_amount': loanAmountParsed,
              },
              SetOptions(merge: true),
            );
          } else {
            print('loan cannot be provided since balance fund is not enough');
          }
        } else {
          print('Invalid loan amount format');
        }
      } else {
        print('Loan amount is empty');
      }

      // if (int.parse(loanAmountTextControllerLoanApproveScreen.text) <
      //     currentBalanceValue) {
      //   print(
      //       'Insufficient Balance Fund, please choose lesser amount, below: $currentBalanceValue');
      // }
    }
  } catch (e) {
    print('Error checking loan status: $e');
    // Handle errors as needed
  }

  // Future<void> updateDbDataForLoanApproval() async {
  //   // Create or update the required fields in the document for loan approval
  //   await documentReferenceInsideCheckLoanActiveFunction.set(
  //     {
  //       'is_loan_active': true,
  //       'loan_amount': loanAmountParsed,
  //     },
  //     SetOptions(merge: true),
  //   );
  // }
}

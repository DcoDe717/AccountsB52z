// ignore_for_file: avoid_print
import 'package:accounts3/screens/admin/admin_common_files.dart';
import 'package:accounts3/screens/admin/functions/months_emi_calculator_func.dart';
import 'package:accounts3/screens/global/global_variables.dart';
import 'package:accounts3/screens/home/common_variables_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../home/home_screen.dart';

Future<void> loanApprovalProcess(
    String? memberCheckLoanActive, BuildContext ctxCheckLoanActive) async {
  print('checkLoanActive passed value is $memberCheckLoanActive');
  // Get the document reference
  final DocumentReference documentReferenceInsideCheckLoanActiveFunction =
      firestoreInstanceCall
          .collection('loan_installments')
          .doc(memberCheckLoanActive);
  try {
    // Get the document snapshot
    final DocumentSnapshot snapshot =
        await documentReferenceInsideCheckLoanActiveFunction.get();

    // Check if the document exists and 'isActive' is true / level 0 (if)
    if (snapshot.exists &&
        (snapshot.data() as Map<String, dynamic>)['isloanactive'] == true) {
      print(
          'Loan is active, cannot approve anymore loan, finish the active loan first');
    }
    // level 0 (else)
    else {
      print('Loan is not active, please avail new loan');

      loanAmountTextFromTextController =
          loanAmountTextControllerLoanApproveScreen.text.trim();

      // level 1 (if)
      if (loanAmountTextFromTextController.isNotEmpty) {
        // Attempt to parse the input as an integer
        loanAmountParsed = int.tryParse(loanAmountTextFromTextController);

        // level 2 (if)
        if (loanAmountParsed != null) {
          // Valid integer, continue processing

          // level 3 (if)
          if (loanAmountParsed! < balanceFundTotal) {
            // Main Section: Your logic here
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
                'comments_loan_approve':
                    commentsTextFromTextControllerLoanApproveScreen,
                    'loan_amount_pending_to_pay':loanAmountParsed
              },
              SetOptions(merge: true),
            );

            approvedMonthAndEMIMonthsListCreator();
            updateApprovedMonthDateAndEmiList();

            

            // Calling Confirmation popup for 2 seconds and navigate to Homescreen
            showAlertAndNavigate(
                ctxCheckLoanActive, loanAmountParsed, memberCheckLoanActive);

            // Calling state clearing function after loan is approved
            stateClear();
          }
          // level 3 (else)
          else {
            print('loan cannot be provided since balance fund is not enough');
          }
        }
        // level 2 (else)
        else {
          print('Invalid loan amount format');
        }
      }
      // level 1 (else)
      else {
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
}

// Function to clear the fields after loan approval screen is close
void stateClear() {
  selectedDropdownValueAdmin = null;
  loanAmountTextControllerLoanApproveScreen.clear();
  commentsTextControllerLoanApproveScreen.clear();
}

// Function to show confirmation alert to the screen and navigate to Home screen after 2 seconds
void showAlertAndNavigate(
    BuildContext context, int? approvedAmount, String? approvedToMember) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded border
        ),
        title: const Text(
          'Loan Approved.',
          style: TextStyle(
            color: Colors.green, // Green text
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // 24pt font
          ),
        ),
        content: Text(
          '₹ ${approvedAmount.toString()} approved for $approvedToMember',
          style: const TextStyle(
            fontSize: 18, // 18pt font
          ),
        ),
      );
    },
  );

  // Delay for 2 seconds using a Timer
  Timer(const Duration(seconds: 2), () {
    // Close the alert dialog
    Navigator.pop(context);

    // Navigate to the Home screen cleaning the push stack
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenHome(),
        ),
        (route) => false);
  });
}

// Funtion to calculate the pending loan amount to pay

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
